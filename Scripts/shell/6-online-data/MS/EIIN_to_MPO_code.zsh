# script to get MPO code by EIIN

while read EIIN; do 
curl http://163.47.156.104:8080/BANBEISR/getGenInfoEntryFormVarification1School.do\?eiin\=$EIIN\&\&year\=2020 | 
grep mpoCodeSchool | 
sed "s/.*value=\"\([0-9]*\)\".*/EIIN: $EIIN mpo code: \1/" >> ./results/EIIN_MPO_CODE.txt
done < ./results/EIIN.txt