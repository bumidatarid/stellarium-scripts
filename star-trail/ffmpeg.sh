#!/bin/sh

ffmpeg -r 60 \
	-f image2 -s 2732x1366 -i work/%05d.png \
	-f avi -c:v huffyuv -crf 25 -pix_fmt yuv420p wellington.avi
