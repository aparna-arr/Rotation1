#!/bin/bash 

samtools merge hg19_WT_K27ac.bam /data1/share/TMP/HWT33_1_hg19.bam /data1/share/TMP/HWT33_2_hg19.bam /data1/share/TMP/HWT33_O_hg19.bam /data1/share/TMP/HWT33_R_hg19.bam /data1/share/TMP/ori_hg19_WT33_K27ac.bam /data1/share/TMP/rep_hg19_WT-K27ac.bam

samtools merge hg19_WT_INPUT.bam /data1/share/TMP/INPUT_HWT33_hg19.bam /data1/share/TMP/ori_hg19_WT33_NCC_Input.bam /data1/share/TMP/PE_ori_hg19_WT33_Input.bam


