#solve the images directory input taking problem
#to rotate pictures from vartical to horizontal
for i in images/*
do 
(( $(identify -format '%w > %h' $i) )) && convert $i -rotate 90 $i
done

#solve the image directory input taking problem
#reduce the picture the quality
for i in images/*
do 
convert $i -quality 50 -resize 900x1200 $i
done

#solve the image directory input taking problem
#pdf making permission from /etc/ImageMagick-6/policy.xml
#create the pdf
ls images/* | sort -V | tr '\n' ' ' | sed 's/$/\ mydoc.pdf/' | xargs convert


#always understand the code create a pdf from pictures
