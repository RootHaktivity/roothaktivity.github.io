---
layout: default
title: Media Node
---

<section class="hero cinema-node">
    <div class="hero-inner">
        <h1 class="cinema-title">[CINEMA_NODE]</h1>
        <p class="hero-tagline">Decentralized Media Access • Encrypted Tunnel Active</p>
        
        <p class="hero-terminal">
            <span class="prompt">leegion</span>@<span class="host">roothaktivity</span>:<span class="path">/mnt/media</span>$ ./access_jellyfin.sh
        </p>

        <div class="cinema-status-box">
            <div class="status-header">
                <span class="status-dot"></span> SYSTEM_READY
            </div>
            <div class="status-content">
                <p class="status-text">UPLINK: <span class="highlight">CONNECTED</span></p>
                <p class="status-text">ENCRYPTION: <span class="highlight">WIRE GUARD</span></p>
                <div class="hero-ctas">
                    <a class="btn btn-primary cinema-btn" href="https://leegion-pc.tailbcf815.ts.net:8920" target="_blank">INITIALIZE_SESSION</a>
                </div>
            </div>
        </div>

        <section class="hacker-ethos">
            <h2>Access Protocol</h2>
            <p>Ensure your <strong>Tailscale</strong> node is active before connecting.</p>
        </section>
    </div>
</section>

<style>
    /* Prevent the title from breaking into 3 lines */
    .cinema-title {
        font-size: clamp(1.2rem, 7vw, 2.5rem) !important;
        letter-spacing: -1px;
        margin-bottom: 5px;
        color: #ff007f;
        white-space: nowrap; /* Forces one line */
    }

    .hero-tagline {
        font-size: 0.9rem;
        margin-bottom: 20px;
    }

    /* Keeps the terminal command on one line with a scrollbar if it's too long */
    .hero-terminal {
        font-size: 0.75rem !important;
        white-space: nowrap;
        overflow-x: auto;
        padding: 10px;
        background: rgba(0,0,0,0.3);
        border-radius: 4px;
        max-width: 100%;
    }

    .cinema-status-box {
        margin: 20px auto;
        max-width: 350px; /* Slimmer for mobile */
        width: 100%;
        border: 1px solid #6a0dad;
        background: rgba(10, 10, 10, 0.9);
        border-radius: 4px;
    }

    .status-header {
        background: #1a1a1a;
        padding: 6px 12px;
        font-family: monospace;
        font-size: 0.7rem;
        color: #00ffff;
        border-bottom: 1px solid #333;
    }

    .status-content {
        padding: 15px;
        text-align: center;
    }

    /* Custom Button Color to match your logo purple */
    .cinema-btn {
        background: linear-gradient(45deg, #6a0dad, #ff007f) !important;
        border: none !important;
        font-size: 0.8rem !important;
        padding: 12px 20px !important;
        box-shadow: 0 0 10px rgba(106, 13, 173, 0.5);
    }

    .status-text {
        font-family: monospace;
        font-size: 0.8rem;
        color: #ccc;
    }

    .status-dot {
        height: 8px;
        width: 8px;
        background-color: #39ff14;
        border-radius: 50%;
        display: inline-block;
        box-shadow: 0 0 8px #39ff14;
    }

    .highlight { color: #00ffff; }

    /* Hide horizontal scrollbar but keep functionality */
    .hero-terminal::-webkit-scrollbar { display: none; }
</style>
