#!/bin/bash

ls StoreSample/ | cut -f1 -d- | uniq | while read SAMPLE
do
	echo {
	echo group: "'"default"'"
	echo id: "'"$SAMPLE"'",
        echo cancer: "'"Osteosarcoma"'",
        echo assembly: [["'"chr1"'", 122678785],["'"chr2"'", 85426708],["'"chr3"'", 91889043],["'"chr4"'", 88276631],["'"chr5"'", 88915250],["'"chr6"'", 77573801],["'"chr7"'", 80974532],["'"chr8"'", 74330416],["'"chr9"'", 61074082],["'"chr10"'", 69331447],["'"chr11"'", 74389097],["'"chr12"'", 72498081],["'"chr13"'", 63241923],["'"chr14"'", 60966679],["'"chr15"'", 64190966],["'"chr16"'", 59632846],["'"chr17"'", 64289059],["'"chr18"'", 55844845],["'"chr19"'", 53741614],["'"chr20"'", 58134056],["'"chr21"'", 50858623],["'"chr22"'", 61439934],["'"chr23"'", 52294480],["'"chr24"'", 47698779],["'"chr25"'", 51628933],["'"chr26"'", 38964690],["'"chr27"'", 45876710],["'"chr28"'", 41182112],["'"chr29"'", 41845238],["'"chr30"'", 40214260],["'"chr31"'", 39895921],["'"chr32"'", 38810281],["'"chr33"'", 31377067],["'"chr34"'", 42124431],["'"chr35"'", 26524999],["'"chr36"'", 30810995],["'"chr37"'", 30902991],["'"chr38"'", 23914537],["'"chrMT"'", 16727],["'"chrX"'", 123869142]],
        echo sv: "'"https://raw.githubusercontent.com/eugeniomazzone/study-for-chromoscope/refs/heads/main/StoreSample/$SAMPLE-SV.tsv"'",
        echo cnv: "'"https://raw.githubusercontent.com/eugeniomazzone/study-for-chromoscope/refs/heads/main/StoreSample/$SAMPLE-TCN.tsv"'",
        echo note: "'"$SAMPLE"'"
    echo },

done > paste-to-sample.ts