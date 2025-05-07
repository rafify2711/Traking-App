#!/bin/bash

# Create git hooks directory if it doesn't exist
mkdir -p .git/hooks

# Create pre-commit hook
cat <<EOF > .git/hooks/pre-commit
#!/bin/sh
echo "Running dart format..."
flutter format .
git add .
echo "✅ Code formatted and staged again!"
EOF

# Make hook executable
chmod +x .git/hooks/pre-commit

echo "✅ Git hook for dart format installed!"
