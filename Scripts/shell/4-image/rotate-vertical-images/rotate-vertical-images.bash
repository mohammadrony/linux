for image in images/*; do
    read width height < <(identify -format "%w %h" "$image")
    if [ "$width" -gt "$height" ]; then
        convert "$image" -rotate 90 "$image"
    fi
done

# for i in images/* 
# do 
# (( $(identify -format '%w > %h' $i) )) && convert $i -rotate 90 $i
# done
