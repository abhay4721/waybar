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

class="paused"
text=""

if [[ "$status" == "Playing" ]]; then
  class="playing"
  frame=$(( $(date +%s%N) / 500000000 % 6 ))
  frames=(
    "▁▃▂▅▆▃▄▇▂▅▃▁"
    "▂▅▃▇▂▄▆▅▃▇▂▁"
    "▃▇▅▂▆▃▇▄▂▅▃▂"
    "▅▂▆▃▇▅▂▇▃▄▁▃"
    "▇▃▄▆▂▅▇▃▅▂▆▁"
    "▂▆▇▃▅▂▄▇▆▃▅▂"
  )
  text="${frames[$frame]}"
fi

jq -nc \
  --arg text "$text" \
  --arg tooltip "$status: $media_text" \
  --arg class "$class" \
  '{text: $text, tooltip: $tooltip, class: $class}'
