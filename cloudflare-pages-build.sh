#!/usr/bin/env bash
set -euo pipefail

# Mirror gallery-photos/photos to the gallery-images Pages project.
rm -rf dist
mkdir -p dist/photos
cp -R photos/. dist/photos/

# Keep browser caching shorter than edge caching so GitHub deletions and moves
# become visible without requiring a manual cache purge.
cat > dist/_headers <<'EOF'
/photos/*
  Cache-Control: public, max-age=3600, s-maxage=86400, stale-while-revalidate=3600
EOF
