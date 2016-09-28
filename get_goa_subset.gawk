#!/bin/awk -f
# How to run this script: 
# gawk -f get_goa_subset.gawk sample.proteins sample.yeast.goa 
# the script will compare the column 1 of sample.proteins with 
# the column 2 of sample.yeast.goa. If there is a match, it will 
# output the corresponding line from 2nd file.

BEGIN {
    FS="\t";
}
{
    if (FNR==NR){
       tmp=substr($0,1,length($0)-1) # Remove the end of line character 
       a[tmp]=tmp;
       #a[$1]=$1; 
       next;
    }
    if ($2 in a){
       #print $2
       print $0
    }
}

END {
    ;
}
