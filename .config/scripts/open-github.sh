#!/bin/bash
dir="${1:-$PWD}"
cd "$dir" || exit 1

# Check if it's a git repo
if git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    url=$(git -C "$dir" remote get-url origin 2>/dev/null)
    if [[ $url =~ git@github.com:(.*).git ]]; then
        https_url="https://github.com/${BASH_REMATCH[1]}"
        open "$https_url"
    fi
else
    echo "Not a git repo."
fi
