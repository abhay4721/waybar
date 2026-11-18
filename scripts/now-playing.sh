#!/usr/bin/env bash

status=$(playerctl status 2>/dev/null || true)
if [[ -z "$status" ]]; then
  printf '{"text":"","tooltip":"No media playing","class":"stopped"}\n'
  exit 0
fi

artist=$(playerctl metadata artist 2>/dev/null || true)
title=$(playerctl metadata title 2>/dev/null || true)

if [[ -n "$artist" && -n "$title" ]]; then
  text="$artist — $title"
else
  text="${title:-Now playing}"
fi

class="paused"
[[ "$status" == "Playing" ]] && class="playing"

jq -nc \
  --arg text "󰝚 $text" \
  --arg tooltip "$status: $text" \
  --arg class "$class" \
  '{text: $text, tooltip: $tooltip, class: $class}'
