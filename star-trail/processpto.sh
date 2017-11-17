#!/bin/sh

for A in work/*.pto ; do
	B=`basename $A .pto`
	(cd work && hugin_stitch_project -o $B $B.pto)
done
