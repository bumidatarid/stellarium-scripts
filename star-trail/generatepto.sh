#!/bin/sh

for A in work/*-D.png ; do
	B=`basename -- $A -D.png`
	echo $B

	sed \
		-e "s/@@D@@/$B-D.png/g" \
		-e "s/@@E@@/$B-E.png/g" \
		-e "s/@@N@@/$B-N.png/g" \
		-e "s/@@S@@/$B-S.png/g" \
		-e "s/@@U@@/$B-U.png/g" \
		-e "s/@@W@@/$B-W.png/g" \
	< template.pto > work/$B.pto
done
