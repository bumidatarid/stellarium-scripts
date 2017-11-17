#!/bin/sh

for A in work/*-D.tif ; do
    B=work/`basename $A -D.tif`
    echo $B
    cubic2erect $B-N.tif $B-E.tif $B-S.tif $B-W.tif $B-U.tif $B-D.tif $B
    #echo ~/bin/krpano-1.19-pr12/krpanotools cube2sphere $B-N.tiff $B-E.tiff $B-S.tiff $B-W.tiff $B-U.tiff $B-D.tiff -o $B.tiff -f=$B-N.tiff -r=$B-E.tiff -b=$B-S.tiff -l=$B-W.tiff -u=$B-U.tiff -d=$B-D.tiff
    # echo ~/bin/krpano-1.19-pr12/krpanotools cube2sphere -f=$B-N.tiff -r=$B-E.tiff -b=$B-S.tiff -l=$B-W.tiff -u=$B-U.tiff -d=$B-D.tiff $B-N.tiff $B-E.tiff $B-S.tiff $B-W.tiff $B-U.tiff $B-D.tiff -o $B.tiff
    #echo ~/bin/krpano-1.19-pr12/krpanotools cube2sphere -f=$B-N.tiff -r=$B-E.tiff -b=$B-S.tiff -l=$B-W.tiff -u=$B-U.tiff -d=$B-D.tiff -o $B.tiff
    #echo ~/bin/krpano-1.19-pr12/krpanotools cube2sphere $B-N.tiff $B-E.tiff $B-S.tiff $B-W.tiff $B-U.tiff $B-D.tiff -o $B.tiff -l=-W -f=-N -r=-E -b=-S -u=-U -d=-D
    # echo ~/bin/krpano-1.19-pr12/krpanotools cube2sphere $B-N.tiff $B-E.tiff $B-S.tiff $B-W.tiff $B-U.tiff $B-D.tiff -o $B.tiff -l=W -f=N -r=E -b=S -u=U -d=D
done
