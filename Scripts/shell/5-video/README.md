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

## Combine multiple Video into one

```bash
mkdir temp-files
cp ./clips/* temp-files/
count=1
touch list1.txt list2.txt
ls -1v temp-files/ >> list1.txt

for i in $(cat ./list1.txt)
do
    echo "file 'temp-files/$count.mp4'" >> list2.txt
    count=$(($count+1))
done
current_time=$(date "+%Y_%m_%d-%H_%M_%S")
fname=file-$current_time
ffmpeg -f concat -i ./list2.txt -c copy videos/$fname.mkv
cp videos/$fname.mkv ./
rm list1.txt list2.txt
rm temp-files -r
rm clips -r
```
