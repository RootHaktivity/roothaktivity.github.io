---
layout: default
title: Cinema Node
---

<section class="hero">
    <div class="hero-inner">
        <h1 class="hero-title">[ CINEMA_NODE ]</h1>
        <p class="hero-tagline">Decentralized Media Access • Encrypted Tunnel Active</p>
        
        <p class="hero-terminal">
            <span class="prompt">leegion</span>@<span class="host">roothaktivity</span>:<span class="path">/mnt/media</span>$ ./access_jellyfin.sh
        </p>

        <div class="cinema-container">
            <div class="status-bar">
                <span class="status-dot"></span> CONNECTION: <span id="connection-status">TAILSCALE_REQUIRED</span>
            </div>
            
            <div class="iframe-wrapper">
                <iframe src="http://100.x.y.z:8096" allowfullscreen></iframe>
            </div>

            <div class="hero-ctas" style="margin-top: 20px;">
                <a class="btn btn-outline" href="http://100.115.230.112:8096/" target="_blank">Open in Full Terminal</a>
            </div>
        </div>

        <section class="hacker-ethos">
            <h2>Access Protocol</h2>
            <p>This node is hosted on a private Linux instance. To view the uplink, ensure your <strong>Tailscale</strong> node is active and authenticated to the RootHaktivity network.</p>
            <p>If the screen above is blank, the secure tunnel is either dormant or your local client is not authorized.</p>
        </section>
    </div>
</section>

<style>
    .cinema-container {
        margin-top: 30px;
        border: 1px solid #6a0dad;
        background: rgba(0, 0, 0, 0.4);
        padding: 10px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(106, 13, 173, 0.3);
    }
    .status-bar {
        font-family: monospace;
        font-size: 0.8rem;
        color: #00ffff;
        margin-bottom: 10px;
        text-align: left;
    }
    .status-dot {
        height: 8px;
        width: 8px;
        background-color: #ff007f;
        border-radius: 50%;
        display: inline-block;
        margin-right: 5px;
        box-shadow: 0 0 5px #ff007f;
    }
    .iframe-wrapper {
        position: relative;
        width: 100%;
        padding-bottom: 56.25%; /* 16:9 Aspect Ratio */
        height: 0;
        overflow: hidden;
        border: 1px solid #333;
    }
    .iframe-wrapper iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        border: none;
    }
</style>
