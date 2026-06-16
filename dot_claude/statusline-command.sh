#!/bin/bash
input=$(cat)

# User and directory (mirroring Starship username + directory segments)
USER_NAME=$(whoami)
CWD=$(echo "$input" | jq -r '.cwd')
# Shorten path: show last 3 components with ellipsis prefix if longer
SHORT_DIR=$(echo "$CWD" | awk -F'/' '{
  n=NF; if (n<=3) { print $0 } else { print ".../" $(n-2) "/" $(n-1) "/" $n }
}')

# Git branch from workspace repo info
BRANCH=$(git -C "$CWD" --no-optional-locks branch --show-current 2>/dev/null)

# Model and context usage
MODEL=$(echo "$input" | jq -r '.model.display_name')
PERCENT_USED=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Time (matching Starship time format)
TIME=$(date "+%l:%M %p" | sed 's/^ //')

# ANSI colors (Dracula palette, approximated for terminal)
PURPLE='\033[38;2;189;147;249m'   # #bd93f9
CYAN='\033[38;2;139;233;253m'     # #8be9fd
PINK='\033[38;2;255;121;198m'     # #ff79c6
GREEN='\033[38;2;80;250;123m'     # #50fa7b
COMMENT='\033[38;2;98;114;164m'   # #6272a4
RESET='\033[0m'

# Build status line
LINE=""

# User segment
LINE="${LINE}$(printf "${PURPLE}${USER_NAME}${RESET}")"

# Directory segment
LINE="${LINE}$(printf " ${CYAN}${SHORT_DIR}${RESET}")"

# Git branch segment (only if inside a git repo)
if [ -n "$BRANCH" ]; then
  LINE="${LINE}$(printf " ${PINK} ${BRANCH}${RESET}")"
fi

# Model + context segment
if [ -n "$PERCENT_USED" ]; then
  LINE="${LINE}$(printf " ${GREEN}${MODEL}${RESET} ${COMMENT}ctx:${PERCENT_USED}%%${RESET}")"
else
  LINE="${LINE}$(printf " ${GREEN}${MODEL}${RESET}")"
fi

# Time segment
LINE="${LINE}$(printf " ${COMMENT}${TIME}${RESET}")"

printf "%b\n" "$LINE"
