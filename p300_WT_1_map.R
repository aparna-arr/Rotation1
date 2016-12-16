library(reshape)
library(ggplot2)

CTCF<-read.delim("0_hg19_WT_CTCF_p300_WT_intersect.bed.mapwig", header=F)
RAD21<-read.delim("0_hg19_WT_RAD21_p300_WT_intersect.bed.mapwig", header=F)
SLUG<-read.delim("0_hg19_WT_SLUG_p300_WT_intersect.bed.mapwig", header=F)
SNAIL<-read.delim("0_hg19_WT_SNAIL_p300_WT_intersect.bed.mapwig", header=F)
K27ac<-read.delim("MERGE_1_2_0_R_ori_rep__hg19_WT_K27ac_p300_WT_intersect.bed.mapwig", header=F)
ATAC<-read.delim("MERGE_1_2__hg19_WT_ATAC_p300_WT_intersect.bed.mapwig", header=F)
AP2a<-read.delim("MERGE_PE_ori_rep__hg19_WT_AP2a_p300_WT_intersect.bed.mapwig", header=F)
p300<-read.delim("MERGE_PE_ori_rep__hg19_WT_p300_p300_WT_intersect.bed.mapwig", header=F)
FoxP2cs<-read.delim("ori_hg19_WT_FoxP2cs_p300_WT_intersect.bed.mapwig", header=F)
FoxP2sc<-read.delim("ori_hg19_WT_FoxP2sc_p300_WT_intersect.bed.mapwig", header=F)
NR2F1<-read.delim("PE_ori_hg19_WT_NR2F1_p300_WT_intersect.bed.mapwig", header=F)
K4me1<-read.delim("rep_hg19_WT_K4me1_p300_WT_intersect.bed.mapwig", header=F)
K4me3<-read.delim("rep_hg19_WT_K4me3_p300_WT_intersect.bed.mapwig", header=F)

dat<-data.frame(
	CTCF=CTCF$V4,
	RAD21=RAD21$V4,
	SLUG=SLUG$V4,
	SNAIL=SNAIL$V4,
	K27ac=K27ac$V4,
	ATAC=ATAC$V4,
	AP2a=AP2a$V4,
	p300=p300$V4,
	FoxP2cs=FoxP2cs$V4,
	FoxP2sc=FoxP2sc$V4,
	NR2F1=NR2F1$V4,
	K4me1=K4me1$V4,
	K4me3=K4me3$V4
)

dat.m<-melt(dat)


