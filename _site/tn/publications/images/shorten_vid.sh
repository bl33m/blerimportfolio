#!/usr/bin/env bash
in="$1"                            # first arg  = input file
out="${2:-output_20s_avc.mp4}"     # second arg = output (optional)
start="${3:-0}"                    # third arg  = start time (optional)

ffmpeg -y -ss "$start" -i "$in" -t 20 \
    -vf "fps=15,scale=2:720" \
    -c:v h264_nvenc -preset p5 -rc vbr_hq -cq 24 \
    -profile:v high -level:v 4.2 \
    -movflags +faststart \
    -c:a aac -b:a 96k \
    "$out"
