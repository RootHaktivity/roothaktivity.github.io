# Run this in an elevated PowerShell (Run as Administrator)

$ErrorActionPreference = 'Stop'
$RepoPath = "C:\Users\sadis\Documents\GitHub\roothaktivity.github.io"
$Port = 4000
$JekyllImage = "jekyll/jekyll:4.3"
$RubyFallback = "ruby:3.1-bullseye"

function Require-Admin {
	if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
		Write-Host "Please run PowerShell as Administrator." -ForegroundColor Yellow
		exit 1
	}
}

function Get-DockerCli {
	$paths = @(
		"$Env:ProgramFiles\Docker\Docker\resources\bin\docker.exe",
		"$Env:ProgramFiles\Docker\Docker\resources\bin\com.docker.cli.exe"
	)
	foreach ($p in $paths) { if (Test-Path $p) { return $p } }
	$which = Get-Command docker -ErrorAction SilentlyContinue
	if ($which) { return $which.Source }
	throw "Docker CLI not found. Install/launch Docker Desktop."
}

function Start-DockerDesktop {
	$app = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
	if (Test-Path $app) { Start-Process -FilePath $app | Out-Null; Start-Sleep -Seconds 3 }
}

function Wait-DockerEngine {
	param([string]$DockerCli)
	Write-Host "Waiting for Docker engine..."
	$deadline = (Get-Date).AddMinutes(5)
	while ((Get-Date) -lt $deadline) {
		try { & $DockerCli version --format '{{.Server.Version}}' 2>$null | Out-Null; return } catch {}
		Start-Sleep -Seconds 5
	}
	throw "Docker engine did not become ready in time."
}

function Use-CleanDockerConfig {
	$env:DOCKER_CONFIG = "$env:TEMP\dockerconfig"
	New-Item -ItemType Directory -Force -Path $env:DOCKER_CONFIG | Out-Null
	Set-Content -Path (Join-Path $env:DOCKER_CONFIG 'config.json') -Value '{}'
}

function Try-JekyllImage {
	param([string]$DockerCli)

	& $DockerCli pull $JekyllImage

	# Install deps (force ruby platform), ensure working dir is /srv/jekyll
	& $DockerCli run --rm -it -p ${Port}:${Port} `
		-e BUNDLE_FORCE_RUBY_PLATFORM=true `
		-v "${RepoPath}:/srv/jekyll" -v jekyll_bundle:/usr/local/bundle `
		-w /srv/jekyll `
		$JekyllImage sh -lc "gem install jekyll-paginate-v2 -v '~> 2.0' && bundle install"
	if ($LASTEXITCODE -ne 0) { throw "bundle install failed on $JekyllImage" }

	# Serve
	Write-Host "Starting Jekyll on http://127.0.0.1:$Port ..."
	& $DockerCli run --rm -it -p ${Port}:${Port} `
		-e BUNDLE_FORCE_RUBY_PLATFORM=true `
		-v "${RepoPath}:/srv/jekyll" -v jekyll_bundle:/usr/local/bundle `
		-w /srv/jekyll `
		$JekyllImage sh -lc "bundle exec jekyll serve --host 0.0.0.0 --port ${Port} --force_polling"
}

function Try-RubyFallback {
	param([string]$DockerCli)

	& $DockerCli pull $RubyFallback

	# Single-line command (no CRLF), set working dir, install toolchain + gems, then serve
	Write-Host "Falling back to Ruby image '$RubyFallback' ..."
	& $DockerCli run --rm -it -p ${Port}:${Port} `
		-v "${RepoPath}:/srv/jekyll" -v jekyll_bundle:/usr/local/bundle `
		-w /srv/jekyll `
		$RubyFallback bash -lc "apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git && gem install bundler -v 2.3.25 && gem install jekyll && gem install jekyll-paginate-v2 -v '~> 2.0' && BUNDLE_FORCE_RUBY_PLATFORM=true bundle install && bundle exec jekyll serve --host 0.0.0.0 --port ${Port} --force_polling"
}

Require-Admin
if (-not (Test-Path $RepoPath)) { throw "Repo path not found: ${RepoPath}" }
Start-DockerDesktop
$DockerCli = Get-DockerCli
Wait-DockerEngine -DockerCli $DockerCli
Use-CleanDockerConfig

try {
	Try-JekyllImage -DockerCli $DockerCli
} catch {
	Write-Host "Primary image failed: $($_.Exception.Message)" -ForegroundColor Yellow
	Try-RubyFallback -DockerCli $DockerCli
}