#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx

cat <<'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>APSS-GEA-App - DevOps Architecture</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-base: #070b14;
            --card-bg: #0d1527;
            --card-border: #1e293b;
            --text-primary: #f8fafc;
            --text-secondary: #94a3b8;
            --blue-accent: #38bdf8;
            --purple-accent: #a855f7;
            --green-accent: #22c55e;
            --pink-accent: #ec4899;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background-color: var(--bg-base);
            font-family: 'Inter', sans-serif;
            color: var(--text-primary);
            padding: 30px;
            display: flex;
            justify-content: center;
        }
        .container {
            width: 100%;
            max-width: 1200px;
        }
        /* Header Top */
        .top-badges {
            display: flex;
            gap: 12px;
            margin-bottom: 12px;
        }
        .badge {
            font-size: 11px;
            font-weight: 700;
            padding: 5px 12px;
            border-radius: 20px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .badge-blue { background: rgba(56, 189, 248, 0.15); color: var(--blue-accent); border: 1px solid rgba(56, 189, 248, 0.3); }
        .badge-green { background: rgba(34, 197, 94, 0.15); color: var(--green-accent); border: 1px solid rgba(34, 197, 94, 0.3); display: flex; align-items: center; gap: 6px; }
        .dot { width: 7px; height: 7px; border-radius: 50%; background: var(--green-accent); }

        .title-section h1 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .title-section p {
            color: var(--text-secondary);
            font-size: 13px;
            margin-bottom: 24px;
        }

        /* Interactive Buttons */
        .btn-group {
            display: flex;
            gap: 12px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }
        .btn {
            padding: 10px 18px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s ease;
        }
        .btn-green { background: #059669; color: white; }
        .btn-blue { background: #0284c7; color: white; }
        .btn-pink { background: #db2777; color: white; }
        .btn-reset { background: #1e293b; color: var(--text-secondary); border: 1px solid #334155; }
        .btn:hover { filter: brightness(1.15); transform: translateY(-1px); }

        /* Tech Pills */
        .tech-tags {
            display: flex;
            gap: 10px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }
        .tech-tag {
            font-size: 12px;
            padding: 6px 14px;
            border-radius: 20px;
            background: #0f172a;
            border: 1px solid #1e293b;
            color: #cbd5e1;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        /* Profile & Status Cards */
        .status-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }
        .card {
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 12px;
            padding: 20px;
        }
        .profile-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .profile-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .avatar {
            width: 45px;
            height: 45px;
            border-radius: 10px;
            background: linear-gradient(135deg, #6366f1, #a855f7);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }
        .profile-title {
            font-size: 11px;
            text-transform: uppercase;
            color: var(--blue-accent);
            font-weight: 600;
        }
        .profile-name {
            font-size: 18px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .badge-owner {
            font-size: 10px;
            background: rgba(34, 197, 94, 0.2);
            color: var(--green-accent);
            padding: 2px 6px;
            border-radius: 4px;
        }
        .profile-desc {
            font-size: 12px;
            color: var(--text-secondary);
            margin-top: 4px;
        }
        .health-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .health-val {
            font-size: 16px;
            font-weight: 700;
            color: var(--green-accent);
            margin: 6px 0;
        }

        /* Architecture Section */
        .step-banner {
            background: #0f172a;
            border: 1px solid #1e293b;
            border-radius: 8px;
            padding: 12px 18px;
            font-size: 13px;
            font-family: 'JetBrains Mono', monospace;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            color: #38bdf8;
        }

        .layers-grid {
            display: grid;
            grid-template-columns: 1fr 1fr 2fr;
            gap: 20px;
        }
        .layer-col {
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 12px;
            padding: 16px;
        }
        .layer-header {
            font-size: 11px;
            font-weight: 700;
            color: var(--text-secondary);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .flow-box {
            background: #0b1120;
            border: 1px solid #1e293b;
            border-radius: 8px;
            padding: 14px;
            margin-bottom: 12px;
            font-size: 13px;
            transition: all 0.3s ease;
        }
        .flow-box.highlight {
            border-color: var(--pink-accent);
            box-shadow: 0 0 15px rgba(236, 72, 153, 0.3);
        }
        .flow-box h4 {
            font-size: 13px;
            margin-bottom: 6px;
            color: var(--text-primary);
        }
        .flow-box p, .flow-box code {
            font-size: 11px;
            color: var(--text-secondary);
            font-family: 'JetBrains Mono', monospace;
        }
        .code-box {
            margin-top: 8px;
            padding: 8px;
            background: #040711;
            border-radius: 6px;
            font-size: 11px;
            color: #94a3b8;
            font-family: 'JetBrains Mono', monospace;
            white-space: pre-wrap;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Top Status -->
    <div class="top-badges">
        <span class="badge badge-blue">Production Blueprint</span>
        <span class="badge badge-green"><span class="dot"></span> Live & Verified</span>
    </div>

    <!-- Title -->
    <div class="title-section">
        <h1>☁️ APSS-GEA-App Architecture</h1>
        <p>Complete End-to-End Topology: Git → Terraform → AWS VPC → EC2 Nginx Application</p>
    </div>

    <!-- Buttons -->
    <div class="btn-group">
        <button class="btn btn-green" onclick="showInfo()">👤 DevOps Engineer Info</button>
        <button class="btn btn-blue" onclick="traceTraffic()">🌐 Trace User Traffic Flow</button>
        <button class="btn btn-pink" onclick="traceDeploy()">⚙️ Trace Deployment Flow</button>
        <button class="btn btn-reset" onclick="resetFlow()">🔄 Reset</button>
    </div>

    <!-- Tech Pills -->
    <div class="tech-tags">
        <span class="tech-tag">🟣 Terraform v1.5+</span>
        <span class="tech-tag">🟡 AWS EC2 (ap-south-1)</span>
        <span class="tech-tag">🟢 Nginx Web Server</span>
        <span class="tech-tag">🔵 Ubuntu 22.04 LTS</span>
        <span class="tech-tag">🔴 Custom VPC & Subnets</span>
    </div>

    <!-- Status Grid -->
    <div class="status-grid">
        <div class="card profile-card">
            <div class="profile-info">
                <div class="avatar">👨‍💻</div>
                <div>
                    <div class="profile-title">DevOps Lead & Architect</div>
                    <div class="profile-name">Salman Khan <span class="badge-owner">Owner</span></div>
                    <div class="profile-desc">Automated GitOps & Infrastructure as Code on Amazon Web Services</div>
                </div>
            </div>
            <div style="text-align: right; font-size: 11px; color: var(--text-secondary); font-family: 'JetBrains Mono', monospace;">
                Region: ap-south-1<br>Instance: t2.micro
            </div>
        </div>

        <div class="card health-card">
            <div>
                <div style="font-size: 11px; color: var(--text-secondary);">Instance Status</div>
                <div class="health-val">✓ 100% HEALTHY</div>
                <div style="font-size: 11px; color: var(--text-secondary);">Port 80: HTTP Active</div>
            </div>
            <div style="font-size: 26px;">❤️</div>
        </div>
    </div>

    <!-- Pipeline Step Banner -->
    <div class="step-banner" id="status-banner">
        <span id="banner-text">Ready: Infrastructure live & listening for inbound traffic</span>
        <span>systemd: active (running)</span>
    </div>

    <!-- 3-Tier Layer View -->
    <div class="layers-grid">
        <!-- Layer 1 -->
        <div class="layer-col">
            <div class="layer-header">💻 Layer 1: Developer Hub</div>
            <div class="flow-box" id="box-dev">
                <h4>VS Code / PowerShell</h4>
                <p>Engineering workspace root:</p>
                <div class="code-box">APSS-GEA-App/
├── main.tf
├── variables.tf
└── provider.tf</div>
            </div>
        </div>

        <!-- Layer 2 -->
        <div class="layer-col">
            <div class="layer-header">⚙️ Layer 2: IaC Automation</div>
            <div class="flow-box" id="box-iac">
                <h4>Terraform Engine</h4>
                <p>Execution Lifecycle:</p>
                <div class="code-box">1. terraform init
2. terraform plan
3. terraform apply</div>
            </div>
        </div>

        <!-- Layer 3 -->
        <div class="layer-col">
            <div class="layer-header">☁️ Layer 3: AWS Cloud VPC (10.0.0.0/16)</div>
            <div class="flow-box" id="box-cloud">
                <h4>Public Subnet (10.0.1.0/24)</h4>
                <p>Security Group: Allow Port 80 & 22</p>
                <div class="code-box">EC2 Instance: t3.small (Ubuntu 22.04)
Web Server: Nginx Reverse Proxy
Target Status: InService (200 OK)</div>
            </div>
        </div>
    </div>
</div>

<script>
    function resetFlow() {
        document.querySelectorAll('.flow-box').forEach(el => el.classList.remove('highlight'));
        document.getElementById('banner-text').innerText = "Ready: Infrastructure live & listening for inbound traffic";
    }

    function traceTraffic() {
        resetFlow();
        document.getElementById('banner-text').innerText = "Traffic Trace: End-User (Port 80) -> Internet Gateway -> Security Group -> EC2 Nginx";
        document.getElementById('box-cloud').classList.add('highlight');
    }

    function traceDeploy() {
        resetFlow();
        document.getElementById('banner-text').innerText = "Deploy Trace: Local PowerShell -> Terraform State Plan -> AWS Provider API -> Resources Created";
        document.getElementById('box-dev').classList.add('highlight');
        setTimeout(() => document.getElementById('box-iac').classList.add('highlight'), 400);
        setTimeout(() => document.getElementById('box-cloud').classList.add('highlight'), 800);
    }

    function showInfo() {
        alert("DevOps Lead: Salman Khan\nProject: APSS-GEA-App\nStack: Terraform, AWS VPC, EC2 t3.small, Nginx");
    }
</script>
</body>
</html>
EOF

sudo systemctl enable nginx
sudo systemctl restart nginx