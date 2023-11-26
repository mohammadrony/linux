# "pattern" replaced with regex
# {} is a place holder which is set the value of result from the find command
find ./ -name "pattern" -exec convert {} -trim outputfolder/{} \;