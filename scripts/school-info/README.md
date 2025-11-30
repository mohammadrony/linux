# School Info

## Get EIIN No

```sh
# both of them work identical but expressions are different
sed -E 's/[0-9]+\s+A([0-9]{6}).*/\1/' ./ntrca_apply.txt | sort | uniq > ./EIIN.txt
sed 's/^\S*\s*A\([0-9]\{6\}\).*/\1/' ./ntrca_apply.txt | sort | uniq > ./EIIN.txt
```

## School information from EIIN

```sh

while read EIIN; do curl http://example.com/BANBEISR/getGenInfoEntryFormVarification1School.do\?eiin\=$EIIN\&\&year\=2020 |
  grep 'name="eiin"\|mpoCodeSchool\|instituteNameNew\|width:170px;' |
  sed '/value/!d ; s/.*value=\"\([A-Za-z0-9()/ .,@'\''-]*\)\".*/ \1/ ; /^$/d' |
  sed ':a; N; $!ba; s/\n/    /g' >> ./EIIN_SCHOOL_INFO.txt;
  done < ./EIIN.txt
```

## School MPO code by EIIN

```sh

while read EIIN; do
  curl http://example.com/BANBEISR/getGenInfoEntryFormVarification1School.do\?eiin\=$EIIN\&\&year\=2020 |
  grep mpoCodeSchool |
  sed "s/.*value=\"\([0-9]*\)\".*/EIIN: $EIIN mpo code: \1/" >> ./EIIN_MPO_CODE.txt
  done < ./EIIN.txt
```
