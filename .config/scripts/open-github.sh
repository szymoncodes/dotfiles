CURRENT_DIR="$(pwd)"

if [[ -d "$CURRENT_DIR/.git" ]]; then
	gh repo view --web
else
	echo "Not a git repo."
fi
