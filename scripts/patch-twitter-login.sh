#!/bin/bash
set -e

# Script to patch twitter_login plugin to add namespace for AGP 8.x compatibility
# This is required because twitter_login 4.4.2 doesn't have a namespace defined

echo "Patching twitter_login plugin for AGP 8.x compatibility..."

# Find the twitter_login plugin build.gradle file (not the example one)
TWITTER_LOGIN_BUILD_GRADLE=$(find ~/.pub-cache/hosted/pub.dev/twitter_login-* -name "build.gradle" -path "*/android/build.gradle" ! -path "*/example/*" 2>/dev/null | head -n 1)

if [ -z "$TWITTER_LOGIN_BUILD_GRADLE" ]; then
  echo "Error: Could not find twitter_login build.gradle file"
  exit 1
fi

echo "Found twitter_login build.gradle at: $TWITTER_LOGIN_BUILD_GRADLE"

# Check if namespace is already present
if grep -q "namespace" "$TWITTER_LOGIN_BUILD_GRADLE"; then
  echo "Namespace already present in twitter_login build.gradle, skipping patch"
  exit 0
fi

# Add namespace to android block
sed -i.bak '/^android {$/a\
    namespace '\''com.maru.twitter_login'\''
' "$TWITTER_LOGIN_BUILD_GRADLE"

echo "Successfully patched twitter_login build.gradle with namespace"
