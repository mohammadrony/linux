# PDF

## Merge PDF

pdftk

```sh
pdftk A=in1.pdf B=in2.pdf cat A1-2 B3-end output out.pdf
```

```sh
pdftk A=in1.pdf cat A1-2 A3-endeast output out.pdf
```

pdfunite

```sh
pdfunite PDF1.pdf PDF2.pdf PDF-full.pdf
```

```sh
pdfunite `ls -1v doc1*.pdf` doc1.pdf
```

## Image to PDF

Single image to PDF

```sh
convert image.jpg image.pdf
```

Reduce image quality

```sh
convert image.jpg -quality 50 -resize 900x1200 image.jpg
```

Rotate vartical image to horizontal

```sh
for file in images/*; do
  echo $file
  (( $(identify -format '%w > %h' $file) )) && convert $file -rotate 90 new-$file
done
```

Convert images to PDF

```sh
exiftool -all= images/*
# rm images/*_original
for file in images/* ; do
  convert $file -quality 50 -resize 900x1200 $file
done
convert images/*.jpg images.pdf
```

```sh
ls images/* | sort -V | tr '\n' ' ' | sed 's/$/\ my-images.pdf/' | xargs convert
```

## Extract Pages

pdfunite and pdfseparate

```sh
first_page=1
last_page=10
pdfseparate input.pdf -f $first_page -l $last_page page-%d.pdf
```

```sh
ls -1v page-*.pdf | tr '\n' ' ' | sed 's/$/ output.pdf/' | xargs pdfunite
```

pdftk

```sh
pdftk A=in1.pdf B=in2.pdf cat A1-12 B14-end output out1.pdf
```

## A4 Page

Pdfjam

```sh
sudo apt install -y texlive-extra-utils
```

```sh
pdfjam in.pdf --paper a4paper -o out.pdf
```

Ghostscript

```sh
gs \
  -o out.pdf \
  -sDEVICE=pdfwrite \
  -sPAPERSIZE=a4 \
  -dFIXEDMEDIA \
  -dPDFFitPage \
  -dCompatibilityLevel=1.4 \
  in.pdf
```
