#!/bin/sh

ffmpeg -r 60 \
	-f image2 -s 2732x1366 -i work/%05d.png \
	-s 2732x1366 -loop 1 -i watermark-direction.png \
	-s 2732x1366 -loop 1 -i watermark-logo.png \
	-filter_complex "
		[0][1] overlay=shortest=1,format=yuv420p [tmp];
		[tmp][2] overlay=shortest=1,format=yuv420p
	" \
	-vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4
