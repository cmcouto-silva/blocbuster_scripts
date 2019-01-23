input=$1
output=$3.gml
numEdgesKeep=$2

numNodes=$(head -1 $input | sed 's/[^0-9]//g')
numEdgesOrig=$(grep -c edge $input)

keepHi $input $numNodes $numEdgesOrig $numEdgesKeep $output
