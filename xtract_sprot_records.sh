#~/bin/bash 
# This script will download the records for a list of proteins
# from uniprot database.
# How to run: ./xtract_sprot_records.sh sample.proteins downloaded_sprot.dat 
# sample.proteins: a file containing a list of proteins
# downloaded_sprot.dat: an output file name 

outfile=$2
#nrows=$(cat "$1" | wc -l)
main_url="http://www.uniprot.org/uniprot/" 
cat "$@"| 
{
while read name 
do 
 protName=$(echo $name | tr -d '\r')
 dl_url=$main_url$protName".txt"
 wget $dl_url
 fname=$protName".txt"
 cat $fname >> $outfile
 rm $fname
 #break
done 
}
echo "Done"
