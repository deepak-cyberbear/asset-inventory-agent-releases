# Asset Inventory Agent Releases

Public Ubuntu Linux agent releases for the private
[`asset-inventory-agent`](https://github.com/deepak-cyberbear/asset-inventory-agent)
source repository. Anyone can download these assets without a GitHub account:

- [One-command installer](https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/install.sh)
- [Ubuntu x86_64 / AMD64](https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/vulnerability-agent-linux-amd64)
- [Ubuntu ARM64](https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/vulnerability-agent-linux-arm64)
- [Installer package](https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/install-agent-setup.tar.gz)
- [SHA256SUMS](https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/SHA256SUMS)

Run this command on the target Ubuntu VM:

```bash
curl -fsSL https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/install.sh | sudo bash
```

On first install, the script prompts for the backend API URL and saves that
configuration for systemd. It defaults the device ID to the VM hostname and
does not ask for an upload token. Re-running the command upgrades to the latest
release and preserves existing configuration. Pass `--reconfigure` to replace
it, with `--api-url` and `--device-id` to set specific values:

```bash
curl -fsSL https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download/install.sh | sudo bash -s -- --reconfigure --api-url https://catalog.example
```

The VM needs `curl`, `tar`, Python 3, systemd, and outbound access to GitHub and
the backend. The installer verifies release checksums before installing the
binary. The Azure pilot accepts uploads on public HTTPS ingress without
application-level authentication; anyone can submit a report and choose its
device ID. The operator UI remains protected by Microsoft Entra. Source code
remains in the private repository.
