#!/bin/sh

output="$(checkupdates)"
number="$(echo "$output" | wc -l)"
text="$number "

tooltip="$(echo "$output" | sed -z 's/\n/\\n/g')"

echo "{\"text\":\""$text"\",\"tooltip\":\""$tooltip"\", \"class\":\"pacman\", \"percentage\": \"percentage\"}"
# printf '{"text": "text", "tooltip": "tooltipasdfsf", "class": "class", "percentage": "percentage" }'
exit 0
