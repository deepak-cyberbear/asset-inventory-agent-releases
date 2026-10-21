#!/usr/bin/env bash
set -euo pipefail

if [[ "$(id -u)" -ne 0 ]]; then
  echo "Run this installer as root, for example: curl -fsSL <installer-url> | sudo bash" >&2
  exit 1
fi

command -v curl >/dev/null || { echo "curl is required" >&2; exit 1; }
command -v tar >/dev/null || { echo "tar is required" >&2; exit 1; }
command -v python3 >/dev/null || { echo "Python 3 is required" >&2; exit 1; }

release_base="https://github.com/deepak-cyberbear/asset-inventory-agent-releases/releases/latest/download"
work_dir="$(mktemp -d -t vulnerability-agent-install.XXXXXX)"
trap 'rm -rf -- "$work_dir"' EXIT

curl --fail --location --silent --show-error \
  "$release_base/install-agent-setup.tar.gz" \
  --output "$work_dir/install-agent-setup.tar.gz"
curl --fail --location --silent --show-error \
  "$release_base/SHA256SUMS" \
  --output "$work_dir/SHA256SUMS"

grep -Eq '^[[:xdigit:]]{64}  install-agent-setup\.tar\.gz$' "$work_dir/SHA256SUMS" || {
  echo "SHA256SUMS does not contain a valid installer archive checksum" >&2
  exit 1
}
(cd "$work_dir" && grep -F '  install-agent-setup.tar.gz' SHA256SUMS | sha256sum --check --status)
tar --extract --gzip --file "$work_dir/install-agent-setup.tar.gz" --directory "$work_dir"
python3 "$work_dir/scripts/install_agent_local.py" "$@"
