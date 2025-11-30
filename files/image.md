# Image

## Modify Image

Rotate Image

```sh
for image in images/*
  do
  read width height < <(identify -format "%w %h" "$image")
  if [ "$width" -gt "$height" ]; then
    convert "$image" -rotate 90 "$image"
  fi
done
```

```sh
for i in images/* ; do
  (( $(identify -format '%w > %h' $i) )) && convert $i -rotate 90 $i
done
```

Extend to Square image

```sh
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

```sh
exiftool -all= -r *;find ./ -name '*_original' -exec rm {} \;
```

## Convert to Image

PDF to Image

```sh
pdftoppm -jpeg -r 300 input.pdf out.jpeg
```

```sh
convert -density 300 -quality 100 in.pdf out.jpeg
```
