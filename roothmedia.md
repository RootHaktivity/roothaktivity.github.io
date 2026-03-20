---
layout: default
title: Media Node
---

<section class="hero cinema-node">
    <div class="hero-inner">
        <h1 class="cinema-title">[ CINEMA_NODE ]</h1>
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
                    <a class="btn btn-primary" href="https://leegion-pc.tailbcf815.ts.net:8920" target="_blank">INITIALIZE_SESSION</a>
                </div>
            </div>
        </div>

        <section class="hacker-ethos">
            <h2>Access Protocol</h2>
            <p>This node is hosted on a private Linux instance. To view the uplink, ensure your <strong>Tailscale</strong> node is active.</p>
            <p>Mobile users: Ensure the Tailscale app is connected before initializing the session.</p>
        </section>
    </div>
</section>

<style>
    /* Fixed Title Sizing */
    .cinema-title {
        font-size: clamp(1.5rem, 8vw, 3rem) !important;
        margin-bottom: 10px;
        color: #ff007f;
        text-shadow: 0 0 10px rgba(255, 0, 127, 0.5);
    }

    /* Mobile-Friendly Container */
    .cinema-status-box {
        margin: 20px auto;
        max-width: 500px;
        width: 90%;
        border: 1px solid #6a0dad;
        background: rgba(10, 10, 10, 0.8);
        border-radius: 4px;
        overflow: hidden;
        text-align: left;
    }

    .status-header {
        background: #1a1a1a;
        padding: 8px 15px;
        font-family: monospace;
        font-size: 0.75rem;
        color: #00ffff;
        border-bottom: 1px solid #333;
    }

    .status-content {
        padding: 20px;
        text-align: center;
    }

    .status-text {
        font-family: monospace;
        font-size: 0.9rem;
        margin: 5px 0;
        color: #ccc;
    }

    .status-dot {
        height: 8px;
        width: 8px;
        background-color: #39ff14; /* Green for connected */
        border-radius: 50%;
        display: inline-block;
        margin-right: 5px;
        box-shadow: 0 0 8px #39ff14;
    }

    .highlight {
        color: #00ffff;
    }

    /* Ensure Hero-Inner doesn't squish on small screens */
    @media (max-width: 600px) {
        .hero-inner {
            padding: 10px;
        }
        .hero-terminal {
            font-size: 0.7rem;
            word-break: break-all;
        }
    }
</style>
