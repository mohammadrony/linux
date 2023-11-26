del() {
sed '/'$1'/ID; w .temp13412341234123.txt' text.txt
mv .temp13412341234123.txt text.txt
}
