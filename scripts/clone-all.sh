#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST_DIR="${1:-$ROOT_DIR/components}"
mkdir -p "$DEST_DIR"

clone_component() {
  local name="$1"
  local url="$2"
  local target="$DEST_DIR/$name"

  if [[ -d "$target/.git" ]]; then
    printf 'Already present: %s\n' "$target"
    return
  fi

  git clone "$url" "$target"
}

clone_component "ScanBot3000-firmware" "https://github.com/DreamMakers2/ScanBot3000-firmware.git"
clone_component "ScanBot3000-control" "https://github.com/DreamMakers2/ScanBot3000-control.git"
clone_component "ScanBot3000-kinematics" "https://github.com/DreamMakers2/ScanBot3000-kinematics.git"

printf '\nComponents cloned under: %s\n' "$DEST_DIR"
printf 'For the exact reviewed baseline, check out the commit SHAs in manifest.yaml.\n'
