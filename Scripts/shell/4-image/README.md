# Image

## Download Images

Download Images from Google Search

```bash
cat images.json | 
  grep '"url": "https://' | 
  sed 's/.*\(https:.*\)",/\1/' | 
  while read link
    do 
    curl -s -L -I $link |
      gawk -v IGNORECASE=1 '/^Content-Length/ { print $2 }' |
      read length
    echo $length
    length="${length//[$'\t\r\n ']}"
    max_length=2500000
    if [[ "$length" -ge "$max_length" ]]
      then
      i=$(($i+1))
      curl $link -o images/$i.jpeg
    else
      count=$(($count+1))
      echo $count
    fi
  done 
```

## Modify Image

Rotate Image

```bash
for image in images/*
  do
  read width height < <(identify -format "%w %h" "$image")
  if [ "$width" -gt "$height" ]; then
    convert "$image" -rotate 90 "$image"
  fi
done
```

```bash
for i in images/* ; do 
  (( $(identify -format '%w > %h' $i) )) && convert $i -rotate 90 $i
done
```

Extend to Square image

```bash
# find . -name "*.jpg" -exec bash -c "basename \"{}\" && file \"{}\" | awk -F: '{\$1=\"\"; print \$0 }'" \;
find ./images -name "*.*" -exec bash -c 'read width height < <(identify -format "%w %h" {})
    if [ "$width" -gt "$height" ]; then
        convert {} -background transparent -gravity center -extent "$width"x"$width" {}
    else
        convert {} -background transparent -gravity center -extent "$height"x"$height" {}
    fi
    length=500
    convert {} -resize "$length"x"$length" {}' \;
```

Remove Metadata

```bash
exiftool -all= -r *;find ./ -name '*_original' -exec rm {} \;
```

## Convert to Image

PDF to Image

```bash
pdftoppm -jpeg -r 300 input.pdf out.jpeg
```

```bash
convert -density 300 -quality 100 in.pdf out.jpeg
```
