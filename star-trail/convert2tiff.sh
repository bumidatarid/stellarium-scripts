#!/bin/sh

# ad-hoc script to convert stuff to tiffs

for A in work/*.png ; do
    echo $A
    convert $A -background white -alpha remove -alpha off -flatten work/`basename $A .png`.tif
done
