#!/usr/bin/env bash
set -euo pipefail
actual="$(printf '%s' "${CONTROLLED_SECRET}" | sha256sum | cut -d ' ' -f 1)"
if [ "$actual" = "$EXPECTED_DIGEST" ]; then
  echo 'ARTIFACT_SCOPE_IMPACT matched=true'
else
  echo 'ARTIFACT_SCOPE_IMPACT matched=false'
  exit 1
fi
