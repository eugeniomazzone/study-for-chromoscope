#!/bin/bash

mkdir StoreSample

cat PRJNA391455/clinical_sample.txt | sed -n '6,$p' | cut -f1 | while read SAMPLE
do
	echo -e chromosome"\t"start"\t"end"\t"major_cn"\t"minor_cn"\t"total_cn > StoreSample/$SAMPLE-TCN.txt
	cat PRJNA391455/TCN.txt | grep $SAMPLE | awk '{ print $3"\t"$4"\t"$5"\t"$7"\t"$8"\t"$9}'  >> StoreSample/$SAMPLE-TCN.txt
done

cat PRJNA391455/clinical_sample.txt | sed -n '6,$p' | cut -f1 | while read SAMPLE
do
	echo -e chrom1"\t"start1"\t"end1"\t"chrom2"\t"start2"\t"end2"\t"sv_id"\t"strand1"\t"strand2"\t"sv_class > StoreSample/$SAMPLE-SV.txt
	cat PRJNA391455/sv_data.txt | grep $SAMPLE | awk '$10=="3to5" {print $3"\t"$4"\t"$4+1"\t"$5"\t"$6"\t"$6+1"\t"$7"\t""\+""\t""\-""\t"$9}'  >> StoreSample/$SAMPLE-SV.txt
	cat PRJNA391455/sv_data.txt | grep $SAMPLE | awk '$10=="3to3" {print $3"\t"$4"\t"$4+1"\t"$5"\t"$6"\t"$6+1"\t"$7"\t""\+""\t""\+""\t"$9}'  >> StoreSample/$SAMPLE-SV.txt
	cat PRJNA391455/sv_data.txt | grep $SAMPLE | awk '$10=="5to3" {print $3"\t"$4"\t"$4+1"\t"$5"\t"$6"\t"$6+1"\t"$7"\t""\-""\t""\+""\t"$9}'  >> StoreSample/$SAMPLE-SV.txt
	cat PRJNA391455/sv_data.txt | grep $SAMPLE | awk '$10=="5to5" {print $3"\t"$4"\t"$4+1"\t"$5"\t"$6"\t"$6+1"\t"$7"\t""\-""\t""\-""\t"$9}'  >> StoreSample/$SAMPLE-SV.txt
done
