input=$1
threshold=$2
output=$3.gml

nrow=$(wc -l $input | cut -f1 -d' ')
ncol=$(head -1 $input | wc -w)

numInd=$(echo $nrow-1 | bc)
numSNPs=$(echo $ncol -1 | bc)
numHeadRows=1
numHeadCols=1

ccc $input $output $threshold $numInd $numSNPs $numHeadRows $numHeadCols
