#!/bin/bash

echo "==========================================="
echo "🏁 Wrapping Up Development Environment (dev:ending)"
echo "==========================================="

echo -e "\n[1/4] Updating tasks.md..."
if [ ! -f "tasks.md" ]; then
    echo "# Tasks" > tasks.md
    echo "- [ ] Initial setup" >> tasks.md
fi
echo "  tasks.md is present. (AI assistant: please ensure this file is fully updated before committing)"

echo -e "\n[2/4] Archiving completed OpenSpec changes..."
# Check if there are changes to archive
if [ -d "openspec/changes" ]; then
    echo "  Checking for completed changes to archive..."
    # We can rely on the AI using /opsx:archive or the CLI
    npx openspec archive --all --yes 2>/dev/null || echo "  No changes archived automatically."
else
    echo "  No active OpenSpec changes found."
fi

echo -e "\n[3/4] Writing handover document (handover.md)..."
echo "  (AI assistant: Please update handover.md with today's progress, what is incomplete, and context for the next session.)"
if [ ! -f "handover.md" ]; then
    echo "# Handover Document" > handover.md
    echo "Last updated: $(date)" >> handover.md
fi

echo -e "\n[4/4] Pushing code to GitHub..."
git add .
read -p "Enter commit message (or press enter for default): " commit_msg
if [ -z "$commit_msg" ]; then
    commit_msg="chore: dev wrapup and handover update"
fi
git commit -m "$commit_msg"
git push origin main || echo "  Warning: Could not push to origin main. Ensure your remote is configured."

echo -e "\nAll wrapup tasks completed. Great job today!\n"
