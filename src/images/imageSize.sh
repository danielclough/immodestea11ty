#!/bin/bash

widths=(300 500 700 1200)

for width in "${widths[@]}"; do
		rm -fr ${width}
		mkdir ${width}
	for file in $(ls $dir); do
		if [[ $(file -b ${file}) =~ JPEG ]]; then
			name=`basename ${file} .jpg`
			convert	${file} -thumbnail  ${width} -filter Triangle -define filter:support=2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 256 -quality 50 -interlace none -colorspace sRGB ${width}/${name}_${width}.jpg
			echo srcset=${width}/${name}_${width}.jpg ${width}w >> srcset.txt
		fi
	done
done