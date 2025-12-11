#!/bin/bash

set -e

# Repository Config
REPO_URL="https://raw.githubusercontent.com/zesbe/CliAllModel/main"
SCRIPT_NAME="claude-all"
INSTALL_DIR="$HOME/.local/bin"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Installing Claude Code Multi-Model Launcher...${NC}"

# Ensure install directory exists
mkdir -p "$INSTALL_DIR"

# Download the main script
echo -e "📥 Downloading ${SCRIPT_NAME}..."
if curl -fsSL "$REPO_URL/$SCRIPT_NAME" -o "$INSTALL_DIR/$SCRIPT_NAME"; then
    echo -e "${GREEN}Download successful!${NC}"
else
    echo -e "${RED}Download failed. Check your internet connection or the repository URL.${NC}"
    exit 1
fi

# Make executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Check Dependencies
echo -e "${BLUE}Checking dependencies...${NC}"

# Check for npm
if ! command -v npm &> /dev/null; then
    echo -e "⚠️  npm not found. Please install Node.js and npm."
fi

# Check for Python
if ! command -v python3 &> /dev/null; then
    echo -e "⚠️  python3 not found. Please install Python 3.10+."
fi

# Check for claude-code
if ! command -v claude &> /dev/null; then
    echo -e "📦 Installing @anthropic-ai/claude-code..."
    if command -v npm &> /dev/null; then
        npm install -g @anthropic-ai/claude-code
    else
        echo -e "❌ Cannot install claude-code: npm is missing."
    fi
fi

# Add to PATH if needed
case ":$PATH:" in
    *":$INSTALL_DIR:"*) ;; # Already in PATH
    *)
        echo -e "Adding $INSTALL_DIR to PATH in .bashrc"
        echo "export PATH=\"
$PATH:$INSTALL_DIR\"" >> "$HOME/.bashrc"
        export PATH="$PATH:$INSTALL_DIR"
        ;;
esac

echo -e "${GREEN}✅ Installation Complete!${NC}"
echo -e "Run the tool by typing: ${GREEN}$SCRIPT_NAME${NC}"
