# PDF

## Merge PDF

```bash
pdfunite PDF1.pdf PDF2.pdf PDF-full.pdf
```

```bash
pdfunite `ls -1v doc1*.pdf` doc1.pdf
```

## Convert Image to PDF

Reduce Image quality

```bash
convert image.jpg -quality 50 -resize 900x1200 image.jpg
```

Rotate Vartical Image to Horizontal

```bash
(( $(identify -format '%w > %h' $i) )) && convert $i -rotate 90 $i
```

Convert images to PDF

```bash
mkdir image_copy
cp images/* image_copy
exiftool -all= image_copy/*
rm image_copy/*_original
for i in image_copy/* ;do convert $i -quality 50 -resize 900x1200 $i ;done
convert image_copy/*.jpg images.pdf
rm -r image_copy
```

```bash
ls images/* | sort -V | tr '\n' ' ' | sed 's/$/\ my-images.pdf/' | xargs convert
```

## Extract pages to PDFs

```bash
first_page=1
last_page=10
pdfseparate input.pdf -f $first_page -l $last_page page-%d.pdf
sleep 3
ls -1v page-*.pdf | tr '\n' ' ' | sed 's/$/ output.pdf/' | xargs pdfunite
rm page-*.pdf
```

```bash
pdftk A=in1.pdf B=in2.pdf cat A1-12 B14-end output out1.pdf
```
