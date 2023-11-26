mkdir image_copy
cp images/* image_copy
exiftool -all= image_copy/*
rm image_copy/*_original
for i in image_copy/* ;do convert $i -quality 50 -resize 900x1200 $i ;done
convert image_copy/*.jpg images.pdf
rm -r image_copy