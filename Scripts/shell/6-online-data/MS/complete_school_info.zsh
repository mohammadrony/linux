# get complete information about school by EIIN

while read EIIN; do curl http://163.47.156.104:8080/BANBEISR/getGenInfoEntryFormVarification1School.do\?eiin\=$EIIN\&\&year\=2020 | 
  grep 'name="eiin"\|mpoCodeSchool\|instituteNameNew\|width:170px;' |
  sed '/value/!d ; s/.*value=\"\([A-Za-z0-9()/ .,@'\''-]*\)\".*/ \1/ ; /^$/d' |
  sed ':a; N; $!ba; s/\n/    /g' >> ./EIIN_SCHOOL_INFO.txt; 
  done < ./results/EIIN.txt
  