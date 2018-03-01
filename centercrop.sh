#!/bin/sh

# convert $1 -gravity Center -crop 768x768+0+0 +repage $1-out.png

size='%[fx: w>h ? h : w ]'
offset_x='%[fx: w>h ? (w-h)/2 : 0 ]'
offset_y='%[fx: w>h ? 0 : (h-w)/2 ]'
viewport="${size}x${size}+${offset_x}+${offset_y}"

convert $1 -set option:distort:viewport "$viewport" \
    -filter point -distort SRT 0  +repage $1-out.png