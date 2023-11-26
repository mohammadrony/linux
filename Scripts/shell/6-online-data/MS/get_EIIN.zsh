sed -E 's/[0-9]+\s+A([0-9]{6}).*/\1/' ./results/ntrca_applications.txt | sort | uniq > ./results/EIIN.txt
# find uniq EIIN number from ntrca_applications.txt file
# both of them work identical but expressions are different
sed 's/^\S*\s*A\([0-9]\{6\}\).*/\1/' ./results/ntrca_applications.txt | sort | uniq > ./results/EIIN.txt