# Script to convert plink file to blocbuster
plink=$1
out=$2

# Transforming
cut -d' ' -f7- $plink.ped | sed "s/ //g" | sed "s/.\{2\}/&\t/g" > $out

# Adding column for individuals
cut -d' ' -f2 $plink.ped > $plink_tmp.txt
paste -d'\t' $plink_tmp.txt $out > tmp & mv tmp $out

# Adding line for SNPs
echo indiv `cut -f2 $plink.map` > $plink_tmp.txt
tr ' ' '\t' < $plink_tmp.txt > tmp && mv tmp $plink_tmp.txt

cat $plink_tmp.txt $out > tmp && mv tmp $out
rm $plink_tmp.txt
