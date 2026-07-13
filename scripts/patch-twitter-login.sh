#!/bin/bash
set -e

# Script to patch twitter_login plugin to add namespace for AGP 8.x compatibility
# This is required because twitter_login 4.4.2 doesn't have a namespace defined

echo "Patching twitter_login plugin for AGP 8.x compatibility..."

# Determine pub cache directory (supports both local and CI environments)
if [ -n "$PUB_CACHE" ]; then
  PUB_CACHE_DIR="$PUB_CACHE"
elif [ -n "$FLUTTER_ROOT" ]; then
  PUB_CACHE_DIR="$FLUTTER_ROOT/.pub-cache"
else
  PUB_CACHE_DIR="$HOME/.pub-cache"
fi

echo "Using pub cache directory: $PUB_CACHE_DIR"

# Find the twitter_login plugin build.gradle file (not the example one)
TWITTER_LOGIN_BUILD_GRADLE=$(find "$PUB_CACHE_DIR/hosted" -name "build.gradle" -path "*/twitter_login-*/android/build.gradle" ! -path "*/example/*" 2>/dev/null | head -n 1)

if [ -z "$TWITTER_LOGIN_BUILD_GRADLE" ]; then
  echo "Error: Could not find twitter_login build.gradle file"
  echo "Searched in: $PUB_CACHE_DIR/hosted"
  echo "Available twitter_login directories:"
  find "$PUB_CACHE_DIR/hosted" -type d -name "twitter_login-*" 2>/dev/null || echo "None found"
  exit 1
fi

echo "Found twitter_login build.gradle at: $TWITTER_LOGIN_BUILD_GRADLE"

# Check if namespace is already present
if grep -q "namespace" "$TWITTER_LOGIN_BUILD_GRADLE"; then
  echo "Namespace already present in twitter_login build.gradle, skipping patch"
  exit 0
fi

# Add namespace to android block
# Use different sed syntax for macOS vs Linux
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  sed -i.bak '/^android {$/a\
    namespace '\''com.maru.twitter_login'\''
' "$TWITTER_LOGIN_BUILD_GRADLE"
else
  # Linux
  sed -i '/^android {$/a\    namespace '\''com.maru.twitter_login'\''' "$TWITTER_LOGIN_BUILD_GRADLE"
fi

echo "Successfully patched twitter_login build.gradle with namespace"
