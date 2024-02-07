#!/bin/bash

# Read current version from the version configuration file
current_version=$(jq -r '.version' version_config.json)

# Increment version (semantic versioning: incrementing patch version)
new_version=$(echo $current_version | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g')

# Update version in the configuration file
jq --arg new_version "$new_version" '.version = $new_version' version_config.json > temp.json && mv temp.json version_config.json

echo "Version updated to: $new_version"
