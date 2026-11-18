#!/usr/bin/env bash

status=$(playerctl status 2>/dev/null || true)
if [[ -z "$status" ]]; then
  printf '{"text":"","tooltip":"No media playing","class":"stopped"}\n'
  exit 0
fi

artist=$(playerctl metadata artist 2>/dev/null || true)
title=$(playerctl metadata title 2>/dev/null || true)

if [[ -n "$artist" && -n "$title" ]]; then
  media_text="$artist — $title"
else
  media_text="${title:-Now playing}"
fi

icons=("󰝚" "󰎇" "󰎈")
icon_index=$(( $(date +%s) % 3 ))
icon="${icons[$icon_index]}"

class="paused"
[[ "$status" == "Playing" ]] && class="playing"

jq -nc \
  --arg text "$icon" \
  --arg tooltip "$status: $media_text" \
  --arg class "$class" \
  '{text: $text, tooltip: $tooltip, class: $class}'
