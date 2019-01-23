input=$1
map=$2
clusters_bfs=$3
cases=$4
controls=$5
output=$6

numHeadRowsGen=1
numHeadColsGen=1

printf "CHR\tSNP\tPOS\n" > $map.mapheader.txt
cut -f1,2,4 $map > $map.snp.info

cat $map.mapheader.txt $map.snp.info > tmp
mv tmp $map.snp.info

numColsSNPinfo=$(head -1 $map.snp.info | wc -w)
numHeadRowsSNPinfo=1

head -1 $input > row_header.txt
sed 1d $input > geno.txt

grep -Fwf $cases geno.txt > cases.txt
cat row_header.txt cases.txt > tmp && mv tmp cases.txt

grep -Fwf $controls geno.txt > controls.txt
cat row_header.txt controls.txt > tmp && mv tmp controls.txt

cases=cases.txt
controls=controls.txt

ncol=$(head -1 $cases | wc -w)
numSNPs=$(echo $ncol -1 | bc)

numCases=$(wc -l $cases | cut -f1 -d' ')
numCases=$(echo $numCases -1 | bc)

numControls=$(wc -l $controls | cut -f1 -d' ')
numControls=$(echo $numControls -1 | bc)

carriers $clusters_bfs $cases $controls $numHeadRowsGen $numHeadColsGen $map.snp.info $numColsSNPinfo $numHeadRowsSNPinfo $numCases $numControls $numSNPs $output
rm $map.mapheader.txt $map.snp.info geno.txt row_header.txt cases.txt controls.txt
