# PDF

## Merge PDF

pdftk

```bash
pdftk A=in1.pdf B=in2.pdf cat A1-2 B3-end output out.pdf
```

```bash
pdftk A=in1.pdf cat A1-2 A3-endeast output out.pdf
```

pdfunite

```bash
pdfunite PDF1.pdf PDF2.pdf PDF-full.pdf
```

```bash
pdfunite `ls -1v doc1*.pdf` doc1.pdf
```

## Image to PDF

Single image to PDF

```bash
convert image.jpg image.pdf
```

Reduce image quality

```bash
convert image.jpg -quality 50 -resize 900x1200 image.jpg
```

Rotate vartical image to horizontal

```bash
for file in images/*; do
  echo $file
  (( $(identify -format '%w > %h' $file) )) && convert $file -rotate 90 new-$file
done
```

Convert images to PDF

```bash
exiftool -all= images/*
# rm images/*_original
for file in images/* ; do
  convert $file -quality 50 -resize 900x1200 $file
done
convert images/*.jpg images.pdf
```

```bash
ls images/* | sort -V | tr '\n' ' ' | sed 's/$/\ my-images.pdf/' | xargs convert
```

## Extract Pages

pdfunite and pdfseparate

```bash
first_page=1
last_page=10
pdfseparate input.pdf -f $first_page -l $last_page page-%d.pdf
```

```bash
ls -1v page-*.pdf | tr '\n' ' ' | sed 's/$/ output.pdf/' | xargs pdfunite
```

pdftk

```bash
pdftk A=in1.pdf B=in2.pdf cat A1-12 B14-end output out1.pdf
```

## A4 Page

Pdfjam

```bash
sudo apt install -y texlive-extra-utils
```

```bash
pdfjam in.pdf --paper a4paper -o out.pdf
```

Ghostscript

```bash
gs \
  -o out.pdf \
  -sDEVICE=pdfwrite \
  -sPAPERSIZE=a4 \
  -dFIXEDMEDIA \
  -dPDFFitPage \
  -dCompatibilityLevel=1.4 \
  in.pdf
```
