#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
EDK2_DIR="${1:-"$ROOT_DIR/../edk2"}"
PATCH_FILE="$ROOT_DIR/patches/edk2-compat-python-ucs2.patch"
TARGET_FILE="$EDK2_DIR/BaseTools/Source/Python/AutoGen/UniClassObject.py"

if [ ! -d "$EDK2_DIR" ]; then
  echo "edk2 directory not found: $EDK2_DIR" >&2
  exit 1
fi

if [ ! -f "$PATCH_FILE" ]; then
  echo "patch file not found: $PATCH_FILE" >&2
  exit 1
fi

if [ ! -f "$TARGET_FILE" ]; then
  echo "target file not found: $TARGET_FILE" >&2
  exit 1
fi

if grep -q "name in ('ucs-2', 'ucs_2')" "$TARGET_FILE"; then
  echo "Patch already present: $(basename "$PATCH_FILE")"
  exit 0
fi

if grep -q "name == 'ucs-2'" "$TARGET_FILE"; then
  perl -0pi -e "s/name == 'ucs-2'/name in ('ucs-2', 'ucs_2')/" "$TARGET_FILE"
  echo "Applied patch: $(basename "$PATCH_FILE")"
  exit 0
fi

echo "Patch could not be applied cleanly: $(basename "$PATCH_FILE")" >&2
exit 1
