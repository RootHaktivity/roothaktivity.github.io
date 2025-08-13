# Prereqs
$ErrorActionPreference = 'Stop'
$RepoPath = "C:\Users\sadis\Documents\GitHub\roothaktivity.github.io"

# 1) Admin check
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
  Write-Host "`nPlease run PowerShell as Administrator." -ForegroundColor Yellow
  exit 1
}

# 2) Enable required Windows features for WSL2 backend
$rebootRequired = $false
foreach ($feat in @("VirtualMachinePlatform","Microsoft-Windows-Subsystem-Linux")) {
  $state = (Get-WindowsOptionalFeature -Online -FeatureName $feat).State
  if ($state -ne "Enabled") {
    Write-Host "Enabling feature: $feat ..."
    dism /online /enable-feature /featurename:$feat /all /norestart | Out-Null
    $rebootRequired = $true
  }
}
if ($rebootRequired) {
  Write-Host "`nA reboot is required. Please restart, then rerun this script." -ForegroundColor Yellow
  exit 3010
}

# 3) Ensure WSL default version is 2
try { wsl --set-default-version 2 | Out-Null } catch {}

# 4) Install Docker Desktop (via winget if available, else direct download)
if (Get-Command winget -ErrorAction SilentlyContinue) {
  Write-Host "Installing Docker Desktop via winget..."
  winget install -e --id Docker.DockerDesktop --accept-package-agreements --accept-source-agreements --silent
} else {
  Write-Host "winget not found; downloading Docker Desktop installer..."
  $installer = "$env:TEMP\DockerDesktopInstaller.exe"
  Invoke-WebRequest -UseBasicParsing -Uri "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe" -OutFile $installer
  Start-Process -FilePath $installer -ArgumentList "install","--quiet","--accept-license" -Wait
}

# 5) Start Docker Desktop
$dockerApp = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
if (Test-Path $dockerApp) {
  Write-Host "Starting Docker Desktop..."
  Start-Process -FilePath $dockerApp | Out-Null
} else {
  Write-Host "Docker Desktop app not found yet. If install just completed, log out/in and rerun." -ForegroundColor Yellow
}

# 6) Wait for Docker engine
Write-Host "Waiting for Docker engine to be ready (up to 5 minutes)..."
$deadline = (Get-Date).AddMinutes(5)
$engineReady = $false
while ((Get-Date) -lt $deadline) {
  if (Get-Command docker -ErrorAction SilentlyContinue) {
    try {
      docker version --format '{{.Server.Version}}' 2>$null | Out-Null
      $engineReady = $true
      break
    } catch {}
  }
  Start-Sleep -Seconds 5
}
if (-not $engineReady) {
  Write-Host "`nDocker engine did not come up in time. Open Docker Desktop, wait until it's running, then rerun the last two docker commands below." -ForegroundColor Yellow
  exit 1
}

# 7) Serve the Jekyll site in Docker
if (-not (Test-Path $RepoPath)) {
  Write-Host "Repo path not found: $RepoPath" -ForegroundColor Red
  exit 1
}
Set-Location $RepoPath

Write-Host "Installing Ruby gems in container (first run may take a few minutes)..."
docker run --rm -it -p 4000:4000 -v "${PWD}:/srv/jekyll" jekyll/jekyll:3.9 bundle install

Write-Host "`nStarting Jekyll server at http://127.0.0.1:4000 ..."
docker run --rm -it -p 4000:4000 -v "${PWD}:/srv/jekyll" jekyll/jekyll:3.9 bundle exec jekyll serve --host 0.0.0.0 --force_polling