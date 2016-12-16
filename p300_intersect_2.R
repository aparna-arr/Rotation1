library(reshape)
library(ggplot2)
source("panels.R")

## REPLICATES ##

# Replicate: PEori
# Center

center_PEori_CTCF<-read.delim("PE_ori_p300_mapwig/0_hg19_WT_CTCF_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_RAD21<-read.delim("PE_ori_p300_mapwig/0_hg19_WT_RAD21_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_SLUG<-read.delim("PE_ori_p300_mapwig/0_hg19_WT_SLUG_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_SNAIL<-read.delim("PE_ori_p300_mapwig/0_hg19_WT_SNAIL_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_K27ac<-read.delim("PE_ori_p300_mapwig/MERGE_1_2_0_R_ori_rep__hg19_WT_K27ac_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_ATAC<-read.delim("PE_ori_p300_mapwig/MERGE_1_2__hg19_WT_ATAC_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_AP2a<-read.delim("PE_ori_p300_mapwig/MERGE_PE_ori_rep__hg19_WT_AP2a_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_p300<-read.delim("PE_ori_p300_mapwig/MERGE_PE_ori_rep__hg19_WT_p300_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_FoxP2cs<-read.delim("PE_ori_p300_mapwig/ori_hg19_WT_FoxP2cs_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_FoxP2sc<-read.delim("PE_ori_p300_mapwig/ori_hg19_WT_FoxP2sc_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_NR2F1<-read.delim("PE_ori_p300_mapwig/PE_ori_hg19_WT_NR2F1_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_K4me1<-read.delim("PE_ori_p300_mapwig/rep_hg19_WT_K4me1_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
center_PEori_K4me3<-read.delim("PE_ori_p300_mapwig/rep_hg19_WT_K4me3_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)

# Flank

flank_PEori_CTCF<-read.delim("PE_ori_p300_mapwig_flank/0_hg19_WT_CTCF_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_RAD21<-read.delim("PE_ori_p300_mapwig_flank/0_hg19_WT_RAD21_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_SLUG<-read.delim("PE_ori_p300_mapwig_flank/0_hg19_WT_SLUG_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_SNAIL<-read.delim("PE_ori_p300_mapwig_flank/0_hg19_WT_SNAIL_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_K27ac<-read.delim("PE_ori_p300_mapwig_flank/MERGE_1_2_0_R_ori_rep__hg19_WT_K27ac_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_ATAC<-read.delim("PE_ori_p300_mapwig_flank/MERGE_1_2__hg19_WT_ATAC_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_AP2a<-read.delim("PE_ori_p300_mapwig_flank/MERGE_PE_ori_rep__hg19_WT_AP2a_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_p300<-read.delim("PE_ori_p300_mapwig_flank/MERGE_PE_ori_rep__hg19_WT_p300_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_FoxP2cs<-read.delim("PE_ori_p300_mapwig_flank/ori_hg19_WT_FoxP2cs_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_FoxP2sc<-read.delim("PE_ori_p300_mapwig_flank/ori_hg19_WT_FoxP2sc_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_NR2F1<-read.delim("PE_ori_p300_mapwig_flank/PE_ori_hg19_WT_NR2F1_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_K4me1<-read.delim("PE_ori_p300_mapwig_flank/rep_hg19_WT_K4me1_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
flank_PEori_K4me3<-read.delim("PE_ori_p300_mapwig_flank/rep_hg19_WT_K4me3_500_bp_flank_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)

# Replicate: rep
# Center

center_rep_CTCF<-read.delim("rep_p300_mapwig/0_hg19_WT_CTCF_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_RAD21<-read.delim("rep_p300_mapwig/0_hg19_WT_RAD21_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_SLUG<-read.delim("rep_p300_mapwig/0_hg19_WT_SLUG_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_SNAIL<-read.delim("rep_p300_mapwig/0_hg19_WT_SNAIL_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_K27ac<-read.delim("rep_p300_mapwig/MERGE_1_2_0_R_ori_rep__hg19_WT_K27ac_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_ATAC<-read.delim("rep_p300_mapwig/MERGE_1_2__hg19_WT_ATAC_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_AP2a<-read.delim("rep_p300_mapwig/MERGE_PE_ori_rep__hg19_WT_AP2a_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_p300<-read.delim("rep_p300_mapwig/MERGE_PE_ori_rep__hg19_WT_p300_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_FoxP2cs<-read.delim("rep_p300_mapwig/ori_hg19_WT_FoxP2cs_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_FoxP2sc<-read.delim("rep_p300_mapwig/ori_hg19_WT_FoxP2sc_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_NR2F1<-read.delim("rep_p300_mapwig/PE_ori_hg19_WT_NR2F1_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_K4me1<-read.delim("rep_p300_mapwig/rep_hg19_WT_K4me1_rep_hg19_WT_p300_peaks.mapwig", header=F)
center_rep_K4me3<-read.delim("rep_p300_mapwig/rep_hg19_WT_K4me3_rep_hg19_WT_p300_peaks.mapwig", header=F)

# Flank

flank_rep_CTCF<-read.delim("rep_p300_mapwig_flank/0_hg19_WT_CTCF_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_RAD21<-read.delim("rep_p300_mapwig_flank/0_hg19_WT_RAD21_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_SLUG<-read.delim("rep_p300_mapwig_flank/0_hg19_WT_SLUG_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_SNAIL<-read.delim("rep_p300_mapwig_flank/0_hg19_WT_SNAIL_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_K27ac<-read.delim("rep_p300_mapwig_flank/MERGE_1_2_0_R_ori_rep__hg19_WT_K27ac_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_ATAC<-read.delim("rep_p300_mapwig_flank/MERGE_1_2__hg19_WT_ATAC_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_AP2a<-read.delim("rep_p300_mapwig_flank/MERGE_PE_ori_rep__hg19_WT_AP2a_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_p300<-read.delim("rep_p300_mapwig_flank/MERGE_PE_ori_rep__hg19_WT_p300_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_FoxP2cs<-read.delim("rep_p300_mapwig_flank/ori_hg19_WT_FoxP2cs_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_FoxP2sc<-read.delim("rep_p300_mapwig_flank/ori_hg19_WT_FoxP2sc_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_NR2F1<-read.delim("rep_p300_mapwig_flank/PE_ori_hg19_WT_NR2F1_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_K4me1<-read.delim("rep_p300_mapwig_flank/rep_hg19_WT_K4me1_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)
flank_rep_K4me3<-read.delim("rep_p300_mapwig_flank/rep_hg19_WT_K4me3_500_bp_flank_rep_hg19_WT_p300_peaks.mapwig", header=F)


# COMBINED REPLICATES

# flank

flank_CTCF<-read.delim("500bp_flank_p300_intersect_2/0_hg19_WT_CTCF_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_RAD21<-read.delim("500bp_flank_p300_intersect_2/0_hg19_WT_RAD21_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_SLUG<-read.delim("500bp_flank_p300_intersect_2/0_hg19_WT_SLUG_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_SNAIL<-read.delim("500bp_flank_p300_intersect_2/0_hg19_WT_SNAIL_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_K27ac<-read.delim("500bp_flank_p300_intersect_2/MERGE_1_2_0_R_ori_rep__hg19_WT_K27ac_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_ATAC<-read.delim("500bp_flank_p300_intersect_2/MERGE_1_2__hg19_WT_ATAC_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_AP2a<-read.delim("500bp_flank_p300_intersect_2/MERGE_PE_ori_rep__hg19_WT_AP2a_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_p300<-read.delim("500bp_flank_p300_intersect_2/MERGE_PE_ori_rep__hg19_WT_p300_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_FoxP2cs<-read.delim("500bp_flank_p300_intersect_2/ori_hg19_WT_FoxP2cs_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_FoxP2sc<-read.delim("500bp_flank_p300_intersect_2/ori_hg19_WT_FoxP2sc_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_NR2F1<-read.delim("500bp_flank_p300_intersect_2/PE_ori_hg19_WT_NR2F1_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_K4me1<-read.delim("500bp_flank_p300_intersect_2/rep_hg19_WT_K4me1_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
flank_K4me3<-read.delim("500bp_flank_p300_intersect_2/rep_hg19_WT_K4me3_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)

# center

center_CTCF<-read.delim("p300_intersect_2/0_hg19_WT_CTCF_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_RAD21<-read.delim("p300_intersect_2/0_hg19_WT_RAD21_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_SLUG<-read.delim("p300_intersect_2/0_hg19_WT_SLUG_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_SNAIL<-read.delim("p300_intersect_2/0_hg19_WT_SNAIL_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_K27ac<-read.delim("p300_intersect_2/MERGE_1_2_0_R_ori_rep__hg19_WT_K27ac_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_ATAC<-read.delim("p300_intersect_2/MERGE_1_2__hg19_WT_ATAC_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_AP2a<-read.delim("p300_intersect_2/MERGE_PE_ori_rep__hg19_WT_AP2a_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_p300<-read.delim("p300_intersect_2/MERGE_PE_ori_rep__hg19_WT_p300_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_FoxP2cs<-read.delim("p300_intersect_2/ori_hg19_WT_FoxP2cs_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_FoxP2sc<-read.delim("p300_intersect_2/ori_hg19_WT_FoxP2sc_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_NR2F1<-read.delim("p300_intersect_2/PE_ori_hg19_WT_NR2F1_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_K4me1<-read.delim("p300_intersect_2/rep_hg19_WT_K4me1_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
center_K4me3<-read.delim("p300_intersect_2/rep_hg19_WT_K4me3_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)

## INPUT CONTROL ##

# rep p300 peaks
input_CTCF_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/0_hg19_WT_INPUT_CTCF_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_RAD21_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/0_hg19_WT_INPUT_RAD21_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_SLUG_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/0_hg19_WT_INPUT_SLUG_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_SNAIL_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/0_hg19_WT_INPUT_SNAIL_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_K27ac_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/MERGE_1_2_0_R_rep_ori__hg19_WT_INPUT_K27ac_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_AP2a_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/MERGE_rep_PE_ori__hg19_WT_INPUT_AP2a_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_p300_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/MERGE_rep_PE_ori__hg19_WT_INPUT_p300_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_FoxP2cs_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/ori_hg19_WT_INPUT_FoxP2cs_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_FoxP2sc_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/ori_hg19_WT_INPUT_FoxP2sc_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_NR2F1_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/PE_ori_hg19_WT_INPUT_NR2F1_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_K4me1_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/rep_hg19_WT_INPUT_K4me1_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_K4me3_rep<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/rep_hg19_WT_INPUT_K4me3_rep_hg19_WT_p300_peaks.mapwig", header=F)

# PEori p300 peaks
input_CTCF_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/0_hg19_WT_INPUT_CTCF_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_RAD21_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/0_hg19_WT_INPUT_RAD21_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_SLUG_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/0_hg19_WT_INPUT_SLUG_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_SNAIL_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/0_hg19_WT_INPUT_SNAIL_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_K27ac_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/MERGE_1_2_0_R_rep_ori__hg19_WT_INPUT_K27ac_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_AP2a_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/MERGE_rep_PE_ori__hg19_WT_INPUT_AP2a_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_p300_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/MERGE_rep_PE_ori__hg19_WT_INPUT_p300_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_FoxP2cs_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/ori_hg19_WT_INPUT_FoxP2cs_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_FoxP2sc_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/ori_hg19_WT_INPUT_FoxP2sc_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_NR2F1_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/PE_ori_hg19_WT_INPUT_NR2F1_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_K4me1_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/rep_hg19_WT_INPUT_K4me1_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
input_K4me3_PEori<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_PEori/rep_hg19_WT_INPUT_K4me3_PE_ori_hg19_WT_p300_peaks.mapwig", header=F)
## END 

## Panelcor Setup ##

center_PEori_dat<-data.frame(
	CTCF=center_PEori_CTCF$V4,
	RAD21=center_PEori_RAD21$V4,
	SLUG=center_PEori_SLUG$V4,
	SNAIL=center_PEori_SNAIL$V4,
	K27ac=center_PEori_K27ac$V4,
	ATAC=center_PEori_ATAC$V4,
	AP2a=center_PEori_AP2a$V4,
	p300=center_PEori_p300$V4,
	FoxP2cs=center_PEori_FoxP2cs$V4,
	FoxP2sc=center_PEori_FoxP2sc$V4,
	NR2F1=center_PEori_NR2F1$V4,
	K4me1=center_PEori_K4me1$V4,
	K4me3=center_PEori_K4me3$V4
)

center_PEori_dat.m<-melt(center_PEori_dat)

center_rep_dat<-data.frame(
	CTCF=center_rep_CTCF$V4,
	RAD21=center_rep_RAD21$V4,
	SLUG=center_rep_SLUG$V4,
	SNAIL=center_rep_SNAIL$V4,
	K27ac=center_rep_K27ac$V4,
	ATAC=center_rep_ATAC$V4,
	AP2a=center_rep_AP2a$V4,
	p300=center_rep_p300$V4,
	FoxP2cs=center_rep_FoxP2cs$V4,
	FoxP2sc=center_rep_FoxP2sc$V4,
	NR2F1=center_rep_NR2F1$V4,
	K4me1=center_rep_K4me1$V4,
	K4me3=center_rep_K4me3$V4
)

center_rep_dat.m<-melt(center_rep_dat)

flank_PEori_dat<-data.frame(
	CTCF=flank_PEori_CTCF$V4,
	RAD21=flank_PEori_RAD21$V4,
	SLUG=flank_PEori_SLUG$V4,
	SNAIL=flank_PEori_SNAIL$V4,
	K27ac=flank_PEori_K27ac$V4,
	ATAC=flank_PEori_ATAC$V4,
	AP2a=flank_PEori_AP2a$V4,
	p300=flank_PEori_p300$V4,
	FoxP2cs=flank_PEori_FoxP2cs$V4,
	FoxP2sc=flank_PEori_FoxP2sc$V4,
	NR2F1=flank_PEori_NR2F1$V4,
	K4me1=flank_PEori_K4me1$V4,
	K4me3=flank_PEori_K4me3$V4
)

flank_PEori_dat.m<-melt(flank_PEori_dat)

flank_rep_dat<-data.frame(
	CTCF=flank_rep_CTCF$V4,
	RAD21=flank_rep_RAD21$V4,
	SLUG=flank_rep_SLUG$V4,
	SNAIL=flank_rep_SNAIL$V4,
	K27ac=flank_rep_K27ac$V4,
	ATAC=flank_rep_ATAC$V4,
	AP2a=flank_rep_AP2a$V4,
	p300=flank_rep_p300$V4,
	FoxP2cs=flank_rep_FoxP2cs$V4,
	FoxP2sc=flank_rep_FoxP2sc$V4,
	NR2F1=flank_rep_NR2F1$V4,
	K4me1=flank_rep_K4me1$V4,
	K4me3=flank_rep_K4me3$V4
)

flank_rep_dat.m<-melt(flank_rep_dat)

# combined replicates

center_dat<-data.frame(
	CTCF=center_CTCF$V4,
	RAD21=center_RAD21$V4,
	SLUG=center_SLUG$V4,
	SNAIL=center_SNAIL$V4,
	K27ac=center_K27ac$V4,
	ATAC=center_ATAC$V4,
	AP2a=center_AP2a$V4,
	p300=center_p300$V4,
	FoxP2cs=center_FoxP2cs$V4,
	FoxP2sc=center_FoxP2sc$V4,
	NR2F1=center_NR2F1$V4,
	K4me1=center_K4me1$V4,
	K4me3=center_K4me3$V4
)

flank_dat<-data.frame(
	CTCF=flank_CTCF$V4,
	RAD21=flank_RAD21$V4,
	SLUG=flank_SLUG$V4,
	SNAIL=flank_SNAIL$V4,
	K27ac=flank_K27ac$V4,
	ATAC=flank_ATAC$V4,
	AP2a=flank_AP2a$V4,
	p300=flank_p300$V4,
	FoxP2cs=flank_FoxP2cs$V4,
	FoxP2sc=flank_FoxP2sc$V4,
	NR2F1=flank_NR2F1$V4,
	K4me1=flank_K4me1$V4,
	K4me3=flank_K4me3$V4
)

# End Panelcor Setup

# Start Boxplot Setup

reps_dat<-list(
	data.frame(CTCF=center_rep_CTCF$V4, group="center", replicate="rep"),
	data.frame(RAD21=center_rep_RAD21$V4, group="center", replicate="rep"),
	data.frame(SLUG=center_rep_SLUG$V4, group="center", replicate="rep"),
	data.frame(SNAIL=center_rep_SNAIL$V4, group="center", replicate="rep"),
	data.frame(K27ac=center_rep_K27ac$V4, group="center", replicate="rep"),
	data.frame(ATAC=center_rep_ATAC$V4, group="center", replicate="rep"),
	data.frame(AP2a=center_rep_AP2a$V4, group="center", replicate="rep"),
	data.frame(p300=center_rep_p300$V4, group="center", replicate="rep"),
	data.frame(FoxP2cs=center_rep_FoxP2cs$V4, group="center", replicate="rep"),
	data.frame(FoxP2sc=center_rep_FoxP2sc$V4, group="center", replicate="rep"),
	data.frame(NR2F1=center_rep_NR2F1$V4, group="center", replicate="rep"),
	data.frame(K4me1=center_rep_K4me1$V4, group="center", replicate="rep"),
	data.frame(K4me3=center_rep_K4me3$V4, group="center", replicate="rep"),
	data.frame(CTCF=center_PEori_CTCF$V4, group="center", replicate="PEori"),
	data.frame(RAD21=center_PEori_RAD21$V4, group="center", replicate="PEori"),
	data.frame(SLUG=center_PEori_SLUG$V4, group="center", replicate="PEori"),
	data.frame(SNAIL=center_PEori_SNAIL$V4, group="center", replicate="PEori"),
	data.frame(K27ac=center_PEori_K27ac$V4, group="center", replicate="PEori"),
	data.frame(ATAC=center_PEori_ATAC$V4, group="center", replicate="PEori"),
	data.frame(AP2a=center_PEori_AP2a$V4, group="center", replicate="PEori"),
	data.frame(p300=center_PEori_p300$V4, group="center", replicate="PEori"),
	data.frame(FoxP2cs=center_PEori_FoxP2cs$V4, group="center", replicate="PEori"),
	data.frame(FoxP2sc=center_PEori_FoxP2sc$V4, group="center", replicate="PEori"),
	data.frame(NR2F1=center_PEori_NR2F1$V4, group="center", replicate="PEori"),
	data.frame(K4me1=center_PEori_K4me1$V4, group="center", replicate="PEori"),
	data.frame(K4me3=center_PEori_K4me3$V4, group="center", replicate="PEori"),
	data.frame(CTCF=flank_rep_CTCF$V4, group="flank", replicate="rep"),
	data.frame(RAD21=flank_rep_RAD21$V4, group="flank", replicate="rep"),
	data.frame(SLUG=flank_rep_SLUG$V4, group="flank", replicate="rep"),
	data.frame(SNAIL=flank_rep_SNAIL$V4, group="flank", replicate="rep"),
	data.frame(K27ac=flank_rep_K27ac$V4, group="flank", replicate="rep"),
	data.frame(ATAC=flank_rep_ATAC$V4, group="flank", replicate="rep"),
	data.frame(AP2a=flank_rep_AP2a$V4, group="flank", replicate="rep"),
	data.frame(p300=flank_rep_p300$V4, group="flank", replicate="rep"),
	data.frame(FoxP2cs=flank_rep_FoxP2cs$V4, group="flank", replicate="rep"),
	data.frame(FoxP2sc=flank_rep_FoxP2sc$V4, group="flank", replicate="rep"),
	data.frame(NR2F1=flank_rep_NR2F1$V4, group="flank", replicate="rep"),
	data.frame(K4me1=flank_rep_K4me1$V4, group="flank", replicate="rep"),
	data.frame(K4me3=flank_rep_K4me3$V4, group="flank", replicate="rep"),
	data.frame(CTCF=flank_PEori_CTCF$V4, group="flank", replicate="PEori"),
	data.frame(RAD21=flank_PEori_RAD21$V4, group="flank", replicate="PEori"),
	data.frame(SLUG=flank_PEori_SLUG$V4, group="flank", replicate="PEori"),
	data.frame(SNAIL=flank_PEori_SNAIL$V4, group="flank", replicate="PEori"),
	data.frame(K27ac=flank_PEori_K27ac$V4, group="flank", replicate="PEori"),
	data.frame(ATAC=flank_PEori_ATAC$V4, group="flank", replicate="PEori"),
	data.frame(AP2a=flank_PEori_AP2a$V4, group="flank", replicate="PEori"),
	data.frame(p300=flank_PEori_p300$V4, group="flank", replicate="PEori"),
	data.frame(FoxP2cs=flank_PEori_FoxP2cs$V4, group="flank", replicate="PEori"),
	data.frame(FoxP2sc=flank_PEori_FoxP2sc$V4, group="flank", replicate="PEori"),
	data.frame(NR2F1=flank_PEori_NR2F1$V4, group="flank", replicate="PEori"),
	data.frame(K4me1=flank_PEori_K4me1$V4, group="flank", replicate="PEori"),
	data.frame(K4me3=flank_PEori_K4me3$V4, group="flank", replicate="PEori")
)

reps_dat.m<-melt(reps_dat)

dat<-list(
	data.frame(CTCF=center_CTCF$V4, group="center"),
	data.frame(RAD21=center_RAD21$V4, group="center"),
	data.frame(SLUG=center_SLUG$V4, group="center"),
	data.frame(SNAIL=center_SNAIL$V4, group="center"),
	data.frame(K27ac=center_K27ac$V4, group="center"),
	data.frame(ATAC=center_ATAC$V4, group="center"),
	data.frame(AP2a=center_AP2a$V4, group="center"),
	data.frame(p300=center_p300$V4, group="center"),
	data.frame(FoxP2cs=center_FoxP2cs$V4, group="center"),
	data.frame(FoxP2sc=center_FoxP2sc$V4, group="center"),
	data.frame(NR2F1=center_NR2F1$V4, group="center"),
	data.frame(K4me1=center_K4me1$V4, group="center"),
	data.frame(K4me3=center_K4me3$V4, group="center"),
	data.frame(CTCF=flank_CTCF$V4, group="flank"),
	data.frame(RAD21=flank_RAD21$V4, group="flank"),
	data.frame(SLUG=flank_SLUG$V4, group="flank"),
	data.frame(SNAIL=flank_SNAIL$V4, group="flank"),
	data.frame(K27ac=flank_K27ac$V4, group="flank"),
	data.frame(ATAC=flank_ATAC$V4, group="flank"),
	data.frame(AP2a=flank_AP2a$V4, group="flank"),
	data.frame(p300=flank_p300$V4, group="flank"),
	data.frame(FoxP2cs=flank_FoxP2cs$V4, group="flank"),
	data.frame(FoxP2sc=flank_FoxP2sc$V4, group="flank"),
	data.frame(NR2F1=flank_NR2F1$V4, group="flank"),
	data.frame(K4me1=flank_K4me1$V4, group="flank"),
	data.frame(K4me3=flank_K4me3$V4, group="flank")
)
dat.m<-melt(dat)

reps_box<-list(
	data.frame(CTCF=center_rep_CTCF[center_rep_CTCF$V4 < quantile(center_rep_CTCF$V4)[4] & center_rep_CTCF$V4 > quantile(center_rep_CTCF$V4)[2], 4], group="center", replicate="rep"),
	data.frame(RAD21=center_rep_RAD21[center_rep_RAD21$V4 < quantile(center_rep_RAD21$V4)[4] & center_rep_RAD21$V4 > quantile(center_rep_RAD21$V4)[2], 4], group="center", replicate="rep"),
	data.frame(SLUG=center_rep_SLUG[center_rep_SLUG$V4 < quantile(center_rep_SLUG$V4)[4] & center_rep_SLUG$V4 > quantile(center_rep_SLUG$V4)[2], 4], group="center", replicate="rep"),
	data.frame(SNAIL=center_rep_SNAIL[center_rep_SNAIL$V4 < quantile(center_rep_SNAIL$V4)[4] & center_rep_SNAIL$V4 > quantile(center_rep_SNAIL$V4)[2], 4], group="center", replicate="rep"),
	data.frame(K27ac=center_rep_K27ac[center_rep_K27ac$V4 < quantile(center_rep_K27ac$V4)[4] & center_rep_K27ac$V4 > quantile(center_rep_K27ac$V4)[2], 4], group="center", replicate="rep"),
	data.frame(ATAC=center_rep_ATAC[center_rep_ATAC$V4 < quantile(center_rep_ATAC$V4)[4] & center_rep_ATAC$V4 > quantile(center_rep_ATAC$V4)[2], 4], group="center", replicate="rep"),
	data.frame(AP2a=center_rep_AP2a[center_rep_AP2a$V4 < quantile(center_rep_AP2a$V4)[4] & center_rep_AP2a$V4 > quantile(center_rep_AP2a$V4)[2], 4], group="center", replicate="rep"),
	data.frame(p300=center_rep_p300[center_rep_p300$V4 < quantile(center_rep_p300$V4)[4] & center_rep_p300$V4 > quantile(center_rep_p300$V4)[2], 4], group="center", replicate="rep"),
	data.frame(FoxP2cs=center_rep_FoxP2cs[center_rep_FoxP2cs$V4 < quantile(center_rep_FoxP2cs$V4)[4] & center_rep_FoxP2cs$V4 > quantile(center_rep_FoxP2cs$V4)[2], 4], group="center", replicate="rep"),
	data.frame(FoxP2sc=center_rep_FoxP2sc[center_rep_FoxP2sc$V4 < quantile(center_rep_FoxP2sc$V4)[4] & center_rep_FoxP2sc$V4 > quantile(center_rep_FoxP2sc$V4)[2], 4], group="center", replicate="rep"),
	data.frame(NR2F1=center_rep_NR2F1[center_rep_NR2F1$V4 < quantile(center_rep_NR2F1$V4)[4] & center_rep_NR2F1$V4 > quantile(center_rep_NR2F1$V4)[2], 4], group="center", replicate="rep"),
	data.frame(K4me1=center_rep_K4me1[center_rep_K4me1$V4 < quantile(center_rep_K4me1$V4)[4] & center_rep_K4me1$V4 > quantile(center_rep_K4me1$V4)[2], 4], group="center", replicate="rep"),
	data.frame(K4me3=center_rep_K4me3[center_rep_K4me3$V4 < quantile(center_rep_K4me3$V4)[4] & center_rep_K4me3$V4 > quantile(center_rep_K4me3$V4)[2], 4], group="center", replicate="rep"),
	data.frame(CTCF=center_PEori_CTCF[center_PEori_CTCF$V4 < quantile(center_PEori_CTCF$V4)[4] & center_PEori_CTCF$V4 > quantile(center_PEori_CTCF$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(RAD21=center_PEori_RAD21[center_PEori_RAD21$V4 < quantile(center_PEori_RAD21$V4)[4] & center_PEori_RAD21$V4 > quantile(center_PEori_RAD21$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(SLUG=center_PEori_SLUG[center_PEori_SLUG$V4 < quantile(center_PEori_SLUG$V4)[4] & center_PEori_SLUG$V4 > quantile(center_PEori_SLUG$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(SNAIL=center_PEori_SNAIL[center_PEori_SNAIL$V4 < quantile(center_PEori_SNAIL$V4)[4] & center_PEori_SNAIL$V4 > quantile(center_PEori_SNAIL$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(K27ac=center_PEori_K27ac[center_PEori_K27ac$V4 < quantile(center_PEori_K27ac$V4)[4] & center_PEori_K27ac$V4 > quantile(center_PEori_K27ac$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(ATAC=center_PEori_ATAC[center_PEori_ATAC$V4 < quantile(center_PEori_ATAC$V4)[4] & center_PEori_ATAC$V4 > quantile(center_PEori_ATAC$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(AP2a=center_PEori_AP2a[center_PEori_AP2a$V4 < quantile(center_PEori_AP2a$V4)[4] & center_PEori_AP2a$V4 > quantile(center_PEori_AP2a$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(p300=center_PEori_p300[center_PEori_p300$V4 < quantile(center_PEori_p300$V4)[4] & center_PEori_p300$V4 > quantile(center_PEori_p300$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(FoxP2cs=center_PEori_FoxP2cs[center_PEori_FoxP2cs$V4 < quantile(center_PEori_FoxP2cs$V4)[4] & center_PEori_FoxP2cs$V4 > quantile(center_PEori_FoxP2cs$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(FoxP2sc=center_PEori_FoxP2sc[center_PEori_FoxP2sc$V4 < quantile(center_PEori_FoxP2sc$V4)[4] & center_PEori_FoxP2sc$V4 > quantile(center_PEori_FoxP2sc$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(NR2F1=center_PEori_NR2F1[center_PEori_NR2F1$V4 < quantile(center_PEori_NR2F1$V4)[4] & center_PEori_NR2F1$V4 > quantile(center_PEori_NR2F1$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(K4me1=center_PEori_K4me1[center_PEori_K4me1$V4 < quantile(center_PEori_K4me1$V4)[4] & center_PEori_K4me1$V4 > quantile(center_PEori_K4me1$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(K4me3=center_PEori_K4me3[center_PEori_K4me3$V4 < quantile(center_PEori_K4me3$V4)[4] & center_PEori_K4me3$V4 > quantile(center_PEori_K4me3$V4)[2], 4], group="center", replicate="PEori"),
	data.frame(CTCF=flank_rep_CTCF[flank_rep_CTCF$V4 < quantile(flank_rep_CTCF$V4)[4] & flank_rep_CTCF$V4 > quantile(flank_rep_CTCF$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(RAD21=flank_rep_RAD21[flank_rep_RAD21$V4 < quantile(flank_rep_RAD21$V4)[4] & flank_rep_RAD21$V4 > quantile(flank_rep_RAD21$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(SLUG=flank_rep_SLUG[flank_rep_SLUG$V4 < quantile(flank_rep_SLUG$V4)[4] & flank_rep_SLUG$V4 > quantile(flank_rep_SLUG$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(SNAIL=flank_rep_SNAIL[flank_rep_SNAIL$V4 < quantile(flank_rep_SNAIL$V4)[4] & flank_rep_SNAIL$V4 > quantile(flank_rep_SNAIL$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(K27ac=flank_rep_K27ac[flank_rep_K27ac$V4 < quantile(flank_rep_K27ac$V4)[4] & flank_rep_K27ac$V4 > quantile(flank_rep_K27ac$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(ATAC=flank_rep_ATAC[flank_rep_ATAC$V4 < quantile(flank_rep_ATAC$V4)[4] & flank_rep_ATAC$V4 > quantile(flank_rep_ATAC$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(AP2a=flank_rep_AP2a[flank_rep_AP2a$V4 < quantile(flank_rep_AP2a$V4)[4] & flank_rep_AP2a$V4 > quantile(flank_rep_AP2a$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(p300=flank_rep_p300[flank_rep_p300$V4 < quantile(flank_rep_p300$V4)[4] & flank_rep_p300$V4 > quantile(flank_rep_p300$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(FoxP2cs=flank_rep_FoxP2cs[flank_rep_FoxP2cs$V4 < quantile(flank_rep_FoxP2cs$V4)[4] & flank_rep_FoxP2cs$V4 > quantile(flank_rep_FoxP2cs$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(FoxP2sc=flank_rep_FoxP2sc[flank_rep_FoxP2sc$V4 < quantile(flank_rep_FoxP2sc$V4)[4] & flank_rep_FoxP2sc$V4 > quantile(flank_rep_FoxP2sc$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(NR2F1=flank_rep_NR2F1[flank_rep_NR2F1$V4 < quantile(flank_rep_NR2F1$V4)[4] & flank_rep_NR2F1$V4 > quantile(flank_rep_NR2F1$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(K4me1=flank_rep_K4me1[flank_rep_K4me1$V4 < quantile(flank_rep_K4me1$V4)[4] & flank_rep_K4me1$V4 > quantile(flank_rep_K4me1$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(K4me3=flank_rep_K4me3[flank_rep_K4me3$V4 < quantile(flank_rep_K4me3$V4)[4] & flank_rep_K4me3$V4 > quantile(flank_rep_K4me3$V4)[2], 4], group="flank", replicate="rep"),
	data.frame(CTCF=flank_PEori_CTCF[flank_PEori_CTCF$V4 < quantile(flank_PEori_CTCF$V4)[4] & flank_PEori_CTCF$V4 > quantile(flank_PEori_CTCF$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(RAD21=flank_PEori_RAD21[flank_PEori_RAD21$V4 < quantile(flank_PEori_RAD21$V4)[4] & flank_PEori_RAD21$V4 > quantile(flank_PEori_RAD21$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(SLUG=flank_PEori_SLUG[flank_PEori_SLUG$V4 < quantile(flank_PEori_SLUG$V4)[4] & flank_PEori_SLUG$V4 > quantile(flank_PEori_SLUG$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(SNAIL=flank_PEori_SNAIL[flank_PEori_SNAIL$V4 < quantile(flank_PEori_SNAIL$V4)[4] & flank_PEori_SNAIL$V4 > quantile(flank_PEori_SNAIL$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(K27ac=flank_PEori_K27ac[flank_PEori_K27ac$V4 < quantile(flank_PEori_K27ac$V4)[4] & flank_PEori_K27ac$V4 > quantile(flank_PEori_K27ac$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(ATAC=flank_PEori_ATAC[flank_PEori_ATAC$V4 < quantile(flank_PEori_ATAC$V4)[4] & flank_PEori_ATAC$V4 > quantile(flank_PEori_ATAC$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(AP2a=flank_PEori_AP2a[flank_PEori_AP2a$V4 < quantile(flank_PEori_AP2a$V4)[4] & flank_PEori_AP2a$V4 > quantile(flank_PEori_AP2a$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(p300=flank_PEori_p300[flank_PEori_p300$V4 < quantile(flank_PEori_p300$V4)[4] & flank_PEori_p300$V4 > quantile(flank_PEori_p300$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(FoxP2cs=flank_PEori_FoxP2cs[flank_PEori_FoxP2cs$V4 < quantile(flank_PEori_FoxP2cs$V4)[4] & flank_PEori_FoxP2cs$V4 > quantile(flank_PEori_FoxP2cs$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(FoxP2sc=flank_PEori_FoxP2sc[flank_PEori_FoxP2sc$V4 < quantile(flank_PEori_FoxP2sc$V4)[4] & flank_PEori_FoxP2sc$V4 > quantile(flank_PEori_FoxP2sc$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(NR2F1=flank_PEori_NR2F1[flank_PEori_NR2F1$V4 < quantile(flank_PEori_NR2F1$V4)[4] & flank_PEori_NR2F1$V4 > quantile(flank_PEori_NR2F1$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(K4me1=flank_PEori_K4me1[flank_PEori_K4me1$V4 < quantile(flank_PEori_K4me1$V4)[4] & flank_PEori_K4me1$V4 > quantile(flank_PEori_K4me1$V4)[2], 4], group="flank", replicate="PEori"),
	data.frame(K4me3=flank_PEori_K4me3[flank_PEori_K4me3$V4 < quantile(flank_PEori_K4me3$V4)[4] & flank_PEori_K4me3$V4 > quantile(flank_PEori_K4me3$V4)[2], 4], group="flank", replicate="PEori")
)

reps_box.m<-melt(reps_box)

box<-list(
	data.frame(CTCF=center_CTCF[center_CTCF$V4 < quantile(center_CTCF$V4)[4] & center_CTCF$V4 > quantile(center_CTCF$V4)[2], 4], group="center"),
	data.frame(RAD21=center_RAD21[center_RAD21$V4 < quantile(center_RAD21$V4)[4] & center_RAD21$V4 > quantile(center_RAD21$V4)[2], 4], group="center"),
	data.frame(SLUG=center_SLUG[center_SLUG$V4 < quantile(center_SLUG$V4)[4] & center_SLUG$V4 > quantile(center_SLUG$V4)[2], 4], group="center"),
	data.frame(SNAIL=center_SNAIL[center_SNAIL$V4 < quantile(center_SNAIL$V4)[4] & center_SNAIL$V4 > quantile(center_SNAIL$V4)[2], 4], group="center"),
	data.frame(K27ac=center_K27ac[center_K27ac$V4 < quantile(center_K27ac$V4)[4] & center_K27ac$V4 > quantile(center_K27ac$V4)[2], 4], group="center"),
	data.frame(ATAC=center_ATAC[center_ATAC$V4 < quantile(center_ATAC$V4)[4] & center_ATAC$V4 > quantile(center_ATAC$V4)[2], 4], group="center"),
	data.frame(AP2a=center_AP2a[center_AP2a$V4 < quantile(center_AP2a$V4)[4] & center_AP2a$V4 > quantile(center_AP2a$V4)[2], 4], group="center"),
	data.frame(p300=center_p300[center_p300$V4 < quantile(center_p300$V4)[4] & center_p300$V4 > quantile(center_p300$V4)[2], 4], group="center"),
	data.frame(FoxP2cs=center_FoxP2cs[center_FoxP2cs$V4 < quantile(center_FoxP2cs$V4)[4] & center_FoxP2cs$V4 > quantile(center_FoxP2cs$V4)[2], 4], group="center"),
	data.frame(FoxP2sc=center_FoxP2sc[center_FoxP2sc$V4 < quantile(center_FoxP2sc$V4)[4] & center_FoxP2sc$V4 > quantile(center_FoxP2sc$V4)[2], 4], group="center"),
	data.frame(NR2F1=center_NR2F1[center_NR2F1$V4 < quantile(center_NR2F1$V4)[4] & center_NR2F1$V4 > quantile(center_NR2F1$V4)[2], 4], group="center"),
	data.frame(K4me1=center_K4me1[center_K4me1$V4 < quantile(center_K4me1$V4)[4] & center_K4me1$V4 > quantile(center_K4me1$V4)[2], 4], group="center"),
	data.frame(K4me3=center_K4me3[center_K4me3$V4 < quantile(center_K4me3$V4)[4] & center_K4me3$V4 > quantile(center_K4me3$V4)[2], 4], group="center"),
	data.frame(CTCF=flank_CTCF[flank_CTCF$V4 < quantile(flank_CTCF$V4)[4] & flank_CTCF$V4 > quantile(flank_CTCF$V4)[2], 4], group="flank"),
	data.frame(RAD21=flank_RAD21[flank_RAD21$V4 < quantile(flank_RAD21$V4)[4] & flank_RAD21$V4 > quantile(flank_RAD21$V4)[2], 4], group="flank"),
	data.frame(SLUG=flank_SLUG[flank_SLUG$V4 < quantile(flank_SLUG$V4)[4] & flank_SLUG$V4 > quantile(flank_SLUG$V4)[2], 4], group="flank"),
	data.frame(SNAIL=flank_SNAIL[flank_SNAIL$V4 < quantile(flank_SNAIL$V4)[4] & flank_SNAIL$V4 > quantile(flank_SNAIL$V4)[2], 4], group="flank"),
	data.frame(K27ac=flank_K27ac[flank_K27ac$V4 < quantile(flank_K27ac$V4)[4] & flank_K27ac$V4 > quantile(flank_K27ac$V4)[2], 4], group="flank"),
	data.frame(ATAC=flank_ATAC[flank_ATAC$V4 < quantile(flank_ATAC$V4)[4] & flank_ATAC$V4 > quantile(flank_ATAC$V4)[2], 4], group="flank"),
	data.frame(AP2a=flank_AP2a[flank_AP2a$V4 < quantile(flank_AP2a$V4)[4] & flank_AP2a$V4 > quantile(flank_AP2a$V4)[2], 4], group="flank"),
	data.frame(p300=flank_p300[flank_p300$V4 < quantile(flank_p300$V4)[4] & flank_p300$V4 > quantile(flank_p300$V4)[2], 4], group="flank"),
	data.frame(FoxP2cs=flank_FoxP2cs[flank_FoxP2cs$V4 < quantile(flank_FoxP2cs$V4)[4] & flank_FoxP2cs$V4 > quantile(flank_FoxP2cs$V4)[2], 4], group="flank"),
	data.frame(FoxP2sc=flank_FoxP2sc[flank_FoxP2sc$V4 < quantile(flank_FoxP2sc$V4)[4] & flank_FoxP2sc$V4 > quantile(flank_FoxP2sc$V4)[2], 4], group="flank"),
	data.frame(NR2F1=flank_NR2F1[flank_NR2F1$V4 < quantile(flank_NR2F1$V4)[4] & flank_NR2F1$V4 > quantile(flank_NR2F1$V4)[2], 4], group="flank"),
	data.frame(K4me1=flank_K4me1[flank_K4me1$V4 < quantile(flank_K4me1$V4)[4] & flank_K4me1$V4 > quantile(flank_K4me1$V4)[2], 4], group="flank"),
	data.frame(K4me3=flank_K4me3[flank_K4me3$V4 < quantile(flank_K4me3$V4)[4] & flank_K4me3$V4 > quantile(flank_K4me3$V4)[2], 4], group="flank")
)

box.m<-melt(box)

# End Boxplot Setup

## PCA 
library(MASS)
library(devtools)
library(ggbiplot)
library(caret)
library(cluster)

## Matrix Construction ##
group_col<-rep("center", length(center_PEori_CTCF$V4))
rep_col<-rep("PEori", length(center_PEori_CTCF$V4))

mat_center_PEori<-cbind.data.frame(center_PEori_CTCF$V4, center_PEori_RAD21$V4, center_PEori_SLUG$V4, center_PEori_SNAIL$V4, center_PEori_K27ac$V4, center_PEori_ATAC$V4, center_PEori_AP2a$V4, center_PEori_p300$V4, center_PEori_FoxP2cs$V4, center_PEori_FoxP2sc$V4, center_PEori_NR2F1$V4, center_PEori_K4me1$V4, center_PEori_K4me3$V4, group_col, rep_col)

colnames(mat_center_PEori) <- c("CTCF", "RAD21", "SLUG", "SNAIL", "K27ac", "ATAC", "AP2a", "p300", "FoxP2cs", "FoxP2sc", "NR2F1", "K4me1", "K4me3", "group", "replicate")

group_col<-rep("flank", length(flank_PEori_CTCF$V4))
rep_col<-rep("PEori", length(flank_PEori_CTCF$V4))

mat_flank_PEori<-cbind.data.frame(flank_PEori_CTCF$V4, flank_PEori_RAD21$V4, flank_PEori_SLUG$V4, flank_PEori_SNAIL$V4, flank_PEori_K27ac$V4, flank_PEori_ATAC$V4, flank_PEori_AP2a$V4, flank_PEori_p300$V4, flank_PEori_FoxP2cs$V4, flank_PEori_FoxP2sc$V4, flank_PEori_NR2F1$V4, flank_PEori_K4me1$V4, flank_PEori_K4me3$V4, group_col, rep_col)

colnames(mat_flank_PEori) <- c("CTCF", "RAD21", "SLUG", "SNAIL", "K27ac", "ATAC", "AP2a", "p300", "FoxP2cs", "FoxP2sc", "NR2F1", "K4me1", "K4me3", "group", "replicate")

group_col<-rep("center", length(center_rep_CTCF$V4))
rep_col<-rep("rep", length(center_rep_CTCF$V4))

mat_center_rep<-cbind.data.frame(center_rep_CTCF$V4, center_rep_RAD21$V4, center_rep_SLUG$V4, center_rep_SNAIL$V4, center_rep_K27ac$V4, center_rep_ATAC$V4, center_rep_AP2a$V4, center_rep_p300$V4, center_rep_FoxP2cs$V4, center_rep_FoxP2sc$V4, center_rep_NR2F1$V4, center_rep_K4me1$V4, center_rep_K4me3$V4, group_col, rep_col)

colnames(mat_center_rep) <- c("CTCF", "RAD21", "SLUG", "SNAIL", "K27ac", "ATAC", "AP2a", "p300", "FoxP2cs", "FoxP2sc", "NR2F1", "K4me1", "K4me3", "group", "replicate")

group_col<-rep("flank", length(flank_rep_CTCF$V4))
rep_col<-rep("rep", length(flank_rep_CTCF$V4))

mat_flank_rep<-cbind.data.frame(flank_rep_CTCF$V4, flank_rep_RAD21$V4, flank_rep_SLUG$V4, flank_rep_SNAIL$V4, flank_rep_K27ac$V4, flank_rep_ATAC$V4, flank_rep_AP2a$V4, flank_rep_p300$V4, flank_rep_FoxP2cs$V4, flank_rep_FoxP2sc$V4, flank_rep_NR2F1$V4, flank_rep_K4me1$V4, flank_rep_K4me3$V4, group_col, rep_col)

colnames(mat_flank_rep) <- c("CTCF", "RAD21", "SLUG", "SNAIL", "K27ac", "ATAC", "AP2a", "p300", "FoxP2cs", "FoxP2sc", "NR2F1", "K4me1", "K4me3", "group", "replicate")

mat<-rbind(mat_center_PEori, mat_center_rep, mat_flank_PEori, mat_flank_rep)
matCenter<-rbind(mat_center_PEori, mat_center_rep)
matFlank<-rbind(mat_flank_PEori, mat_flank_rep)
matPEori<-rbind(mat_center_PEori, mat_flank_PEori)
matRep<-rbind(mat_center_rep, mat_flank_rep)

colnames(mat) <- c("CTCF", "RAD21", "SLUG", "SNAIL", "K27ac", "ATAC", "AP2a", "p300", "FoxP2cs", "FoxP2sc", "NR2F1", "K4me1", "K4me3", "group", "replicate")
colnames(matCenter) <- c("CTCF", "RAD21", "SLUG", "SNAIL", "K27ac", "ATAC", "AP2a", "p300", "FoxP2cs", "FoxP2sc", "NR2F1", "K4me1", "K4me3", "group", "replicate")
colnames(matFlank) <- c("CTCF", "RAD21", "SLUG", "SNAIL", "K27ac", "ATAC", "AP2a", "p300", "FoxP2cs", "FoxP2sc", "NR2F1", "K4me1", "K4me3", "group", "replicate")
colnames(matPEori) <- c("CTCF", "RAD21", "SLUG", "SNAIL", "K27ac", "ATAC", "AP2a", "p300", "FoxP2cs", "FoxP2sc", "NR2F1", "K4me1", "K4me3", "group", "replicate")
colnames(matRep) <- c("CTCF", "RAD21", "SLUG", "SNAIL", "K27ac", "ATAC", "AP2a", "p300", "FoxP2cs", "FoxP2sc", "NR2F1", "K4me1", "K4me3", "group", "replicate")

mat<-as.data.frame(mat)

## End matrix construction ##

# PCA

#mat.small <- data.frame(sapply(mat[,1:13], function(x) as.numeric(as.character(x))))
mat.small<-mat[,1:13]
mat.predict <- predict(preProcess(mat.small, c("BoxCox", "center", "scale")), mat.small)
mat.pca<-prcomp(mat.predict)
matVarExplained = mat.pca$sdev^2 / sum(mat.pca$sdev^2) 

matColors<-character(length(matVarExplained))
curr_sum <- 0
for (i in 1:length(matVarExplained)) {
	curr_sum <- curr_sum + matVarExplained[i]
	if (curr_sum < 0.90) {
		matColors[i] <- c("red")
	} else {
		matColors[i] <- c("grey")
	}
}

print(mat.pca)

#matCenter.small <- data.frame(sapply(matCenter[,1:13], function(x) as.numeric(as.character(x))))
matCenter.small<-matCenter[,1:13]
matCenter.predict <- predict(preProcess(matCenter.small, c("BoxCox", "center", "scale")), matCenter.small)
matCenter.pca<-prcomp(matCenter.predict)
matCenterVarExplained = mat.pca$sdev^2 / sum(mat.pca$sdev^2) 

matCenterColors<-character(length(matVarExplained))
curr_sum <- 0
for (i in 1:length(matCenterVarExplained)) {
	curr_sum <- curr_sum + matCenterVarExplained[i]
	if (curr_sum < 0.90) {
		matCenterColors[i] <- c("red")
	} else {
		matCenterColors[i] <- c("grey")
	}
}

print(matCenter.pca)

#matFlank.small <- data.frame(sapply(matFlank[,1:13], function(x) as.numeric(as.character(x))))
matFlank.small<-matFlank[,1:13]
matFlank.predict <- predict(preProcess(matFlank.small, c("BoxCox", "center", "scale")), matFlank.small)
matFlank.pca<-prcomp(matFlank.predict)
matFlankVarExplained = matFlank.pca$sdev^2 / sum(matFlank.pca$sdev^2) 

matFlankColors<-character(length(matFlankVarExplained))
curr_sum <- 0
for (i in 1:length(matFlankVarExplained)) {
	curr_sum <- curr_sum + matFlankVarExplained[i]
	if (curr_sum < 0.90) {
		matFlankColors[i] <- c("red")
	} else {
		matFlankColors[i] <- c("grey")
	}
}

print(matFlank.pca)

#matPEori.small <- data.frame(sapply(matPEori[,1:13], function(x) as.numeric(as.character(x))))
matPEori.small<-matPEori[,1:13]
matPEori.predict <- predict(preProcess(matPEori.small, c("BoxCox", "center", "scale")), matPEori.small)
matPEori.pca<-prcomp(matPEori.predict)
matPEoriVarExplained = matPEori.pca$sdev^2 / sum(matPEori.pca$sdev^2) 

matPEoriColors<-character(length(matPEoriVarExplained))
curr_sum <- 0
for (i in 1:length(matPEoriVarExplained)) {
	curr_sum <- curr_sum + matPEoriVarExplained[i]
	if (curr_sum < 0.90) {
		matPEoriColors[i] <- c("red")
	} else {
		matPEoriColors[i] <- c("grey")
	}
}

print(matPEori.pca)

#matRep.small <- data.frame(sapply(matRep[,1:13], function(x) as.numeric(as.character(x))))
matRep.small<-matRep[,1:13]

matRep.predict <- predict(preProcess(matRep.small, c("BoxCox", "center", "scale")), matRep.small)
matRep.pca<-prcomp(matRep.predict)
matRepVarExplained = matRep.pca$sdev^2 / sum(matRep.pca$sdev^2) 

matRepColors<-character(length(matRepVarExplained))
curr_sum <- 0
for (i in 1:length(matRepVarExplained)) {
	curr_sum <- curr_sum + matRepVarExplained[i]
	if (curr_sum < 0.90) {
		matRepColors[i] <- c("red")
	} else {
		matRepColors[i] <- c("grey")
	}
}

mat_center_rep.small <-mat_center_rep[,1:13]
mat_center_PEori.small<-mat_center_PEori[,1:13]

print(matRep.pca)

# end PCA

#pdf("p300_intersect_WT_2_plots.pdf", height=15, width=15)
pdf("panelcor_plots.pdf", height=15, width=15)

# panelcor plots
panelcor(center_dat, title="p300_peaks all center")
panelcor(flank_dat, title="p300_peaks all flank")
panelcor(center_PEori_dat, title="PEori_rep peaks center")
panelcor(center_rep_dat, title="rep_rep peaks center")
panelcor(flank_PEori_dat, title="PEori_rep peaks 500 bp flank")
panelcor(flank_rep_dat, title="rep_rep peaks 500 bp flank")

dev.off()
# boxplots

pdf("boxplots.pdf", height=10, width=15)

# combined replicates
ggplot(dat.m, aes(variable,value,fill=group)) + geom_boxplot() + ggtitle("Signal over 500bp flanks / p300 regions")

ggplot(dat.m, aes(variable,log10(value),fill=group)) + geom_boxplot() + ggtitle("log10(Signal) over 500bp flanks / p300 regions")

ggplot(box.m, aes(variable,value,fill=group)) + geom_boxplot() + ggtitle("Signal over 500bp flanks / p300 regions outliers removed")

ggplot(box.m, aes(variable,log10(value),fill=group)) + geom_boxplot() + ggtitle("log10(Signal) over 500bp flanks / p300 regions outliers removed")

# seperate replicates facet group
ggplot(reps_dat.m, aes(variable,value,fill=replicate)) + geom_boxplot() + ggtitle("Signal over 500bp flanks / p300 regions") + facet_grid(~group)

ggplot(reps_dat.m, aes(variable,log10(value),fill=replicate)) + geom_boxplot() + ggtitle("log10(Signal) over 500bp flanks / p300 regions") + facet_grid(~group)

ggplot(reps_box.m, aes(variable,value,fill=replicate)) + geom_boxplot() + ggtitle("Signal over 500bp flanks / p300 regions outliers removed") + facet_grid(~group)

ggplot(reps_box.m, aes(variable,log10(value),fill=replicate)) + geom_boxplot() + ggtitle("log10(Signal) over 500bp flanks / p300 regions outliers removed") + facet_grid(~group)

# seperate replicates facet replicate
ggplot(reps_dat.m, aes(variable,value,fill=group)) + geom_boxplot() + ggtitle("Signal over 500bp flanks / p300 regions") + facet_grid(~replicate)

ggplot(reps_dat.m, aes(variable,log10(value),fill=group)) + geom_boxplot() + ggtitle("log10(Signal) over 500bp flanks / p300 regions") + facet_grid(~replicate)

ggplot(reps_box.m, aes(variable,value,fill=group)) + geom_boxplot() + ggtitle("Signal over 500bp flanks / p300 regions outliers removed") + facet_grid(~replicate)

ggplot(reps_box.m, aes(variable,log10(value),fill=group)) + geom_boxplot() + ggtitle("log10(Signal) over 500bp flanks / p300 regions outliers removed") + facet_grid(~replicate)

dev.off()
# pca

pdf("pca_plots.pdf")

library(gplots)
colors_heatmap<-colorRampPalette(c("darkblue", "white", "darkred"))
colors.palette<-colors_heatmap(100)

heatmap.2(as.matrix(mat.pca$rotation[,1:3]), trace="none", density.info="histogram", scale="none", dendrogram="row", Colv="NA", col=colors.palette, notecol="black", cellnote=round(as.matrix(mat.pca$rotation[,1:3]),4), main="PCA Rotations 1:3 mat")

barplot(100*matVarExplained, las=2, xlab='PCs', names=seq(1:length(mat.predict)), ylab='% Variance Explained', col=matColors)

ggbiplot(mat.pca, obs.scale=1, var.scale=1, groups=mat$group, ellipse=TRUE, circle=TRUE) + scale_color_discrete(name='') + theme(legend.direction = 'horizontal', legend.position = 'top') 

heatmap.2(as.matrix(matCenter.pca$rotation[,1:3]), trace="none", density.info="histogram", scale="none", dendrogram="row", Colv="NA", col=colors.palette, notecol="black", cellnote=round(as.matrix(matCenter.pca$rotation[,1:3]),4), main="PCA Rotations 1:3 matCenter")

barplot(100*matCenterVarExplained, las=2, xlab='PCs', names=seq(1:length(matCenter.predict)), ylab='% Variance Explained', col=matCenterColors)

ggbiplot(matCenter.pca, obs.scale=1, var.scale=1, groups=matCenter$replicate, ellipse=TRUE, circle=TRUE) + scale_color_discrete(name='') + theme(legend.direction = 'horizontal', legend.position = 'top') 

heatmap.2(as.matrix(matFlank.pca$rotation[,1:3]), trace="none", density.info="histogram", scale="none", dendrogram="row", Colv="NA", col=colors.palette, notecol="black", cellnote=round(as.matrix(matFlank.pca$rotation[,1:3]),4), main="PCA Rotations 1:3 matFlank")

barplot(100*matFlankVarExplained, las=2, xlab='PCs', names=seq(1:length(matFlank.predict)), ylab='% Variance Explained', col=matFlankColors)

ggbiplot(matFlank.pca, obs.scale=1, var.scale=1, groups=matFlank$replicate, ellipse=TRUE, circle=TRUE) + scale_color_discrete(name='') + theme(legend.direction = 'horizontal', legend.position = 'top')  

heatmap.2(as.matrix(matPEori.pca$rotation[,1:3]), trace="none", density.info="histogram", scale="none", dendrogram="row", Colv="NA", col=colors.palette, notecol="black", cellnote=round(as.matrix(matPEori.pca$rotation[,1:3]),4), main="PCA Rotations 1:3 matPEori")

barplot(100*matPEoriVarExplained, las=2, xlab='PCs', names=seq(1:length(matPEori.predict)), ylab='% Variance Explained', col=matPEoriColors)

ggbiplot(matPEori.pca, obs.scale=1, var.scale=1, groups=matPEori$group, ellipse=TRUE, circle=TRUE) + scale_color_discrete(name='') + theme(legend.direction = 'horizontal', legend.position = 'top') 

heatmap.2(as.matrix(matRep.pca$rotation[,1:3]), trace="none", density.info="histogram", scale="none", dendrogram="row", Colv="NA", col=colors.palette, notecol="black", cellnote=round(as.matrix(matRep.pca$rotation[,1:3]),4), main="PCA Rotations 1:3 matRep")

barplot(100*matRepVarExplained, las=2, xlab='PCs', names=seq(1:length(matRep.predict)), ylab='% Variance Explained', col=matRepColors)

ggbiplot(matRep.pca, obs.scale=1, var.scale=1, groups=matRep$group, ellipse=TRUE, circle=TRUE) + scale_color_discrete(name='') + theme(legend.direction = 'horizontal', legend.position = 'top')  

dev.off()

pdf("clusters.pdf")

library(fpc)
library(cluster)

mat.h<-hclust(as.dist(1-cor(mat.small, method="spearman")))
matCenter.h<-hclust(as.dist(1-cor(matCenter.small, method="spearman")))
matFlank.h<-hclust(as.dist(1-cor(matFlank.small, method="spearman")))
matPEori.h<-hclust(as.dist(1-cor(matPEori.small, method="spearman")))
matRep.h<-hclust(as.dist(1-cor(matRep.small, method="spearman")))

matCenterRep.h<-hclust(as.dist(1-cor(mat_center_rep.small, method="spearman")))
matCenterPEori.h<-hclust(as.dist(1-cor(mat_center_PEori.small, method="spearman")))

matGroups <- cutree(mat.h, pamk(as.dist(1-cor(mat.small, method="spearman")))$nc)
matCenterGroups <- cutree(matCenter.h, pamk(as.dist(1-cor(matCenter.small, method="spearman")))$nc)
matFlankGroups <- cutree(matFlank.h, pamk(as.dist(1-cor(matFlank.small, method="spearman")))$nc)
matPEoriGroups <- cutree(matPEori.h, pamk(as.dist(1-cor(matPEori.small, method="spearman")))$nc)
matRepGroups <- cutree(matRep.h, pamk(as.dist(1-cor(matRep.small, method="spearman")))$nc)

print(paste0("mat: ", matGroups))
print(paste0("matCenter: ", matCenterGroups))
print(paste0("matFlank: ", matFlankGroups))
print(paste0("matPEori: ", matPEoriGroups))
print(paste0("matRep: ", matRepGroups))

plot(mat.h)
plot(matCenter.h)
plot(matFlank.h)
plot(matPEori.h)
plot(matRep.h)
plot(matCenterRep.h)
plot(matCenterPEori.h)

dev.off()

pdf("input_scatterplots.pdf")

plot(log(input_CTCF_PEori$V4), log(center_PEori_CTCF$V4), pch=16) 
plot(log(input_RAD21_PEori$V4), log(center_PEori_RAD21$V4), pch=16) 
plot(log(input_SLUG_PEori$V4), log(center_PEori_SLUG$V4), pch=16) 
plot(log(input_SNAIL_PEori$V4), log(center_PEori_SNAIL$V4), pch=16) 
plot(log(input_K27ac_PEori$V4), log(center_PEori_K27ac$V4), pch=16) 
plot(log(input_AP2a_PEori$V4), log(center_PEori_AP2a$V4), pch=16) 
plot(log(input_p300_PEori$V4), log(center_PEori_p300$V4), pch=16) 
plot(log(input_FoxP2cs_PEori$V4), log(center_PEori_FoxP2cs$V4), pch=16) 
plot(log(input_FoxP2sc_PEori$V4), log(center_PEori_FoxP2sc$V4), pch=16) 
plot(log(input_NR2F1_PEori$V4), log(center_PEori_NR2F1$V4), pch=16) 
plot(log(input_K4me1_PEori$V4), log(center_PEori_K4me1$V4), pch=16) 
plot(log(input_K4me3_PEori$V4), log(center_PEori_K4me3$V4), pch=16) 
 
plot(log(input_CTCF_rep$V4), log(center_rep_CTCF$V4), pch=16) 
plot(log(input_RAD21_rep$V4), log(center_rep_RAD21$V4), pch=16) 
plot(log(input_SLUG_rep$V4), log(center_rep_SLUG$V4), pch=16) 
plot(log(input_SNAIL_rep$V4), log(center_rep_SNAIL$V4), pch=16) 
plot(log(input_K27ac_rep$V4), log(center_rep_K27ac$V4), pch=16) 
plot(log(input_AP2a_rep$V4), log(center_rep_AP2a$V4), pch=16) 
plot(log(input_p300_rep$V4), log(center_rep_p300$V4), pch=16) 
plot(log(input_FoxP2cs_rep$V4), log(center_rep_FoxP2cs$V4), pch=16) 
plot(log(input_FoxP2sc_rep$V4), log(center_rep_FoxP2sc$V4), pch=16) 
plot(log(input_NR2F1_rep$V4), log(center_rep_NR2F1$V4), pch=16) 
plot(log(input_K4me1_rep$V4), log(center_rep_K4me1$V4), pch=16) 
plot(log(input_K4me3_rep$V4), log(center_rep_K4me3$V4), pch=16) 

dev.off()


#library(fastcluster)
#hcfast<-hclust.vector(matCenter.small, method="ward")

