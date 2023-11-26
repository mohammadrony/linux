newdir="/home/mdrony/Documents/icms"
lang="java"
mkdir -p $newdir

for i in 1
do 
    find line${i}-icms/ \( -wholename "*.$lang" -or -wholename "*.txt" \) -exec zsh -c "ls -l '{}'; cp --parents '{}' $newdir/" \;
done
