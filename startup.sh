#!/bin/bash

echo "==========================================="
echo "🚀 Starting Development Environment (dev:start)"
echo "==========================================="

echo -e "\n[1/3] Pulling latest code from GitHub..."
git pull origin main || echo "  Warning: Could not pull from origin main (maybe no remote yet?)."

echo -e "\n[2/3] Reading handover document (handover.md)..."
if [ -f "handover.md" ]; then
    echo "--- handover.md ---"
    cat handover.md
    echo "-------------------"
else
    echo "  No handover.md found. Creating a blank one."
    echo "# Handover Document" > handover.md
    echo "Welcome to the project! This document tracks the current state." >> handover.md
fi

echo -e "\n[3/3] Suggesting Next Actions..."
echo "  1. Review the handover.md above to understand the current context."
echo "  2. Use '/opsx:continue' if there are active artifacts to resume."
echo "  3. Use '/opsx:new' to start a new change or feature."
echo "  4. Check tasks.md (if any) for the current backlog."

echo -e "\nEnvironment ready. Happy coding!\n"
