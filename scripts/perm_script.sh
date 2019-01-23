input=$1
output=$2

lines=`wc -l $input | cut -f1 -d' '`
nrow=$(echo $lines-1 | bc)
ncol=$(head -1 $input | wc -w)

numDataCols=$(echo $ncol -1 | bc)
numDataRows=$nrow
numHeadCols=1
numHeadRows=1

perm $input $output.txt $numDataCols $numDataRows $numHeadCols $numHeadRows
