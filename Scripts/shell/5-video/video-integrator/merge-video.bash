mkdir video
cp ./video-backup/* video/
count=1
touch files1.txt files2.txt
ls -1v video/ >> files1.txt

for i in $(cat ./files1.txt)
do
    echo "file 'video/$count.mp4'" >> files2.txt
    count=$(($count+1))
done
current_time=$(date "+%Y_%m_%d-%H_%M_%S")
fname=file-$current_time
ffmpeg -f concat -i ./files2.txt -c copy videos/$fname.mkv
cp videos/$fname.mkv ./
rm files1.txt files2.txt
rm video -r
rm video-backup -r
