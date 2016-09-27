#!/bin/awk -f
# This script calculates the minimum, maximum, and 
# average length of the sequences in a fasta file
# How to run this script: 
# gawk -f get_stat-fasta-len.gawk sample.fa

BEGIN {
    n=0 # stores the number of sequences
    len=0 # stores the length of a fasta sequence
    sum=0
    m=0 # stores longest length of all the fasta sequences
    s=1000000 # stores shortest length
}
{
    tmp = substr($0,0,1)
    if (tmp==">"){ # fasta marker
       n++
       if (len>m){
          m=len
       }
       if (len<s && n>1){
          s=len
       }
       sum=sum+len
       len=0 # re-initialize lenght variable for the next sequence
    }
    else { # continuation of the same sequence to the next line
      len = len + length($0)
    } 
}

END {
    if (len>m){ # consider the length of the last sequence
       m=len
    }
    if (len<s){ # consider the length of the last sequence
       s=len
    }
   sum=sum+len
   printf("# of sequences: %d\n", n)
   printf("Minimum length: %d\n", s)
   printf("Maximum length: %d\n", m)
   printf("Average length: %0.2f\n", sum/n)
}
