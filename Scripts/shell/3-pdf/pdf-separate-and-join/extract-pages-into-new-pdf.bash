first_page=1
last_page=10
pdfseparate input.pdf -f $first_page -l $last_page page-%d.pdf
sleep 3
ls -1v page-*.pdf | tr '\n' ' ' | sed 's/$/ output.pdf/' | xargs pdfunite
rm page-*.pdf