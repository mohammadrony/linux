# Video

## Gallary Images to Video

```bash
image="images/image.jpg"
echo $image
read width height < <(identify -format "%w %h" "$image")
echo $width $height
image_x_count=4
image_y_count=3
start_x=0
start_y=0
len_x=$(($width/$image_x_count))
len_y=$(($height/$image_y_count))

for((i=1;i<=$image_x_count;i++)){
    for((j=1;j<=$image_y_count;j++)){
        convert "$image" -crop "$(($len_x))"x"$(($len_y))"+"$(($start_x))"+"$(($start_y))" $i$j.jpg
        start_y=$(($start_y+$len_y))
    }
    start_x=$(($start_x+$len_x))
    start_y=0
}
ffmpeg -f image2 -pattern_type glob -framerate 2 -i '*.jpg' -s "$(($len_x))"x"$(($len_y))" foo.avi
rm *.jpg
```
