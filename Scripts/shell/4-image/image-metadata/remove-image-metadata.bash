#from any where of any directory just run this command
#the all picture from that directory and all of its children directory
#image details will be gone forever
#it is possible to run this command from this current directory
exiftool -all= -r *;find . -name '*_original' -exec rm {} \;