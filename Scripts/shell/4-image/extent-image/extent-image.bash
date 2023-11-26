# huge 
# find . -name "*.jpg" -exec bash -c "basename \"{}\" && file \"{}\" | awk -F: '{\$1=\"\"; print \$0 }'" \;
find ./images -name "*.*" -exec bash -c 'read width height < <(identify -format "%w %h" {})
    if [ "$width" -gt "$height" ]; then
        convert {} -background transparent -gravity center -extent "$width"x"$width" {}
    else
        convert {} -background transparent -gravity center -extent "$height"x"$height" {}
    fi
    length=500
    convert {} -resize "$length"x"$length" {}' \;
