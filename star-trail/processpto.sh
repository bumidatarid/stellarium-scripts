#!/bin/sh

for A in work/019*.pto work/02*.pto ; do
	B=`basename $A .pto`
	#(cd work && hugin_stitch_project -o $B $B.pto)
	(cd work && hugin_executor --stitching --threads=5 --prefix=$B $B.pto)
done
