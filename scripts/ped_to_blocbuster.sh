# Script to convert plink file to blocbuster
plink=$1
out=$2

# Transforming
cut -d' ' -f7- $plink.ped | sed "s/ //g" | sed "s/.\{2\}/&\t/g" > $out

# Adding column for individuals
cut -d' ' -f2 $plink.ped > cut_f2_$plink.txt
paste -d'\t' cut_f2_$plink.txt $out > tmp & mv tmp $out

# Adding line for SNPs
echo indiv `cut -f2 $plink.map` > cut_f2_$plink.txt
cat cut_f2_$plink.txt $out > tmp && mv tmp $out
rm cut_f2_$plink.txt
