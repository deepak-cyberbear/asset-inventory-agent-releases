# Asset Inventory Agent Releases

Public Ubuntu Linux agent releases for the private
[`asset-inventory-agent`](https://github.com/deepak-cyberbear/asset-inventory-agent)
source repository.

Anyone can download release assets without a GitHub account:

- [Ubuntu x86_64 / AMD64](https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/vulnerability-agent-linux-amd64)
- [Ubuntu ARM64](https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/vulnerability-agent-linux-arm64)
- [Remote installer package](https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/install-agent-setup.tar.gz)
- [SHA256SUMS](https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/SHA256SUMS)

To install on an Ubuntu VM from a workstation with `curl`, `tar`, Python 3, and
OpenSSH:

```bash
mkdir -p agent-installer && cd agent-installer
curl -fsSLO https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/install-agent-setup.tar.gz
curl -fsSLO https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/SHA256SUMS
grep ' install-agent-setup.tar.gz$' SHA256SUMS | sha256sum --check
tar -xzf install-agent-setup.tar.gz
python3 scripts/install_agent_remote.py 203.0.113.10 --ssh-user ubuntu --api-url https://catalog.example
```

The installer prompts for `AGENT_UPLOAD_TOKEN` using hidden input, downloads
the latest matching agent binary, verifies its checksum, and installs/configures
the systemd service over SSH. The workstation needs SSH and sudo access to the
Ubuntu VM. No GitHub login is needed, and no GitHub credential is sent to the
VM. Source code remains in the private repository.
