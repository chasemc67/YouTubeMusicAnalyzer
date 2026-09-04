#!/bin/bash

set -euo pipefail

SCRIPT_DIRECTORY="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIRECTORY="$(cd "$SCRIPT_DIRECTORY/.." && pwd)"
APP_NAME="YouTube Music Analyzer"
APP_DIRECTORY="$PROJECT_DIRECTORY/dist/$APP_NAME.app"

cd "$PROJECT_DIRECTORY"
MODULE_CACHE="$PROJECT_DIRECTORY/.build/ModuleCache"
env \
    CLANG_MODULE_CACHE_PATH="$MODULE_CACHE" \
    SWIFTPM_MODULECACHE_OVERRIDE="$MODULE_CACHE" \
    swift build --disable-sandbox -c release --product YouTubeMusicAnalyzer

rm -rf "$APP_DIRECTORY"
mkdir -p "$APP_DIRECTORY/Contents/MacOS" "$APP_DIRECTORY/Contents/Resources"
cp "$PROJECT_DIRECTORY/.build/release/YouTubeMusicAnalyzer" "$APP_DIRECTORY/Contents/MacOS/YouTubeMusicAnalyzer"
cp "$PROJECT_DIRECTORY/Resources/Info.plist" "$APP_DIRECTORY/Contents/Info.plist"
chmod +x "$APP_DIRECTORY/Contents/MacOS/YouTubeMusicAnalyzer"
codesign --force --deep --sign - "$APP_DIRECTORY"

echo "Built: $APP_DIRECTORY"
