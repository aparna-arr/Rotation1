library(reshape)
library(ggplot2)
source("panels.R")

CTCF<-read.delim("500bp_flank_p300_intersect_2/0_hg19_WT_CTCF_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
RAD21<-read.delim("500bp_flank_p300_intersect_2/0_hg19_WT_RAD21_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
SLUG<-read.delim("500bp_flank_p300_intersect_2/0_hg19_WT_SLUG_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
SNAIL<-read.delim("500bp_flank_p300_intersect_2/0_hg19_WT_SNAIL_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
K27ac<-read.delim("500bp_flank_p300_intersect_2/MERGE_1_2_0_R_ori_rep__hg19_WT_K27ac_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
ATAC<-read.delim("500bp_flank_p300_intersect_2/MERGE_1_2__hg19_WT_ATAC_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
AP2a<-read.delim("500bp_flank_p300_intersect_2/MERGE_PE_ori_rep__hg19_WT_AP2a_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
p300<-read.delim("500bp_flank_p300_intersect_2/MERGE_PE_ori_rep__hg19_WT_p300_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
FoxP2cs<-read.delim("500bp_flank_p300_intersect_2/ori_hg19_WT_FoxP2cs_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
FoxP2sc<-read.delim("500bp_flank_p300_intersect_2/ori_hg19_WT_FoxP2sc_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
NR2F1<-read.delim("500bp_flank_p300_intersect_2/PE_ori_hg19_WT_NR2F1_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
K4me1<-read.delim("500bp_flank_p300_intersect_2/rep_hg19_WT_K4me1_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)
K4me3<-read.delim("500bp_flank_p300_intersect_2/rep_hg19_WT_K4me3_500_bp_flank_p300_intersect_rep_PE_ori_cell_WT_2.mapwig",header=F)

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

cutoff_4_CTCF<-quantile(CTCF$V4)[4]
cutoff_2_CTCF<-quantile(CTCF$V4)[2]
box_CTCF<-CTCF[CTCF$V4 < cutoff_4_CTCF & CTCF$V4 > cutoff_2_CTCF,4]

cutoff_4_RAD21<-quantile(RAD21$V4)[4]
cutoff_2_RAD21<-quantile(RAD21$V4)[2]
box_RAD21<-RAD21[RAD21$V4 < cutoff_4_RAD21 & RAD21$V4 > cutoff_2_RAD21,4]

cutoff_4_SLUG<-quantile(SLUG$V4)[4]
cutoff_2_SLUG<-quantile(SLUG$V4)[2]
box_SLUG<-SLUG[SLUG$V4 < cutoff_4_SLUG & SLUG$V4 > cutoff_2_SLUG,4]

cutoff_4_SNAIL<-quantile(SNAIL$V4)[4]
cutoff_2_SNAIL<-quantile(SNAIL$V4)[2]
box_SNAIL<-SNAIL[SNAIL$V4 < cutoff_4_SNAIL & SNAIL$V4 > cutoff_2_SNAIL,4]

cutoff_4_K27ac<-quantile(K27ac$V4)[4]
cutoff_2_K27ac<-quantile(K27ac$V4)[2]
box_K27ac<-K27ac[K27ac$V4 < cutoff_4_K27ac & K27ac$V4 > cutoff_2_K27ac,4]

cutoff_4_ATAC<-quantile(ATAC$V4)[4]
cutoff_2_ATAC<-quantile(ATAC$V4)[2]
box_ATAC<-ATAC[ATAC$V4 < cutoff_4_ATAC & ATAC$V4 > cutoff_2_ATAC,4]

cutoff_4_AP2a<-quantile(AP2a$V4)[4]
cutoff_2_AP2a<-quantile(AP2a$V4)[2]
box_AP2a<-AP2a[AP2a$V4 < cutoff_4_AP2a & AP2a$V4 > cutoff_2_AP2a,4]

cutoff_4_p300<-quantile(p300$V4)[4]
cutoff_2_p300<-quantile(p300$V4)[2]
box_p300<-p300[p300$V4 < cutoff_4_p300 & p300$V4 > cutoff_2_p300,4]

cutoff_4_FoxP2cs<-quantile(FoxP2cs$V4)[4]
cutoff_2_FoxP2cs<-quantile(FoxP2cs$V4)[2]
box_FoxP2cs<-FoxP2cs[FoxP2cs$V4 < cutoff_4_FoxP2cs & FoxP2cs$V4 > cutoff_2_FoxP2cs,4]

cutoff_4_FoxP2sc<-quantile(FoxP2sc$V4)[4]
cutoff_2_FoxP2sc<-quantile(FoxP2sc$V4)[2]
box_FoxP2sc<-FoxP2sc[FoxP2sc$V4 < cutoff_4_FoxP2sc & FoxP2sc$V4 > cutoff_2_FoxP2sc,4]

cutoff_4_NR2F1<-quantile(NR2F1$V4)[4]
cutoff_2_NR2F1<-quantile(NR2F1$V4)[2]
box_NR2F1<-NR2F1[NR2F1$V4 < cutoff_4_NR2F1 & NR2F1$V4 > cutoff_2_NR2F1,4]

cutoff_4_K4me1<-quantile(K4me1$V4)[4]
cutoff_2_K4me1<-quantile(K4me1$V4)[2]
box_K4me1<-K4me1[K4me1$V4 < cutoff_4_K4me1 & K4me1$V4 > cutoff_2_K4me1,4]

cutoff_4_K4me3<-quantile(K4me3$V4)[4]
cutoff_2_K4me3<-quantile(K4me3$V4)[2]
box_K4me3<-K4me3[K4me3$V4 < cutoff_4_K4me3 & K4me3$V4 > cutoff_2_K4me3,4]

cutoff_4_CTCF<-quantile(log10(CTCF$V4))[4]
cutoff_2_CTCF<-quantile(log10(CTCF$V4))[2]
box_log_CTCF<-CTCF[log10(CTCF$V4) < cutoff_4_CTCF & log10(CTCF$V4) > cutoff_2_CTCF,4]

cutoff_4_RAD21<-quantile(log10(RAD21$V4))[4]
cutoff_2_RAD21<-quantile(log10(RAD21$V4))[2]
box_log_RAD21<-RAD21[log10(RAD21$V4) < cutoff_4_RAD21 & log10(RAD21$V4) > cutoff_2_RAD21,4]

cutoff_4_SLUG<-quantile(log10(SLUG$V4))[4]
cutoff_2_SLUG<-quantile(log10(SLUG$V4))[2]
box_log_SLUG<-SLUG[log10(SLUG$V4) < cutoff_4_SLUG & log10(SLUG$V4) > cutoff_2_SLUG,4]

cutoff_4_SNAIL<-quantile(log10(SNAIL$V4))[4]
cutoff_2_SNAIL<-quantile(log10(SNAIL$V4))[2]
box_log_SNAIL<-SNAIL[log10(SNAIL$V4) < cutoff_4_SNAIL & log10(SNAIL$V4) > cutoff_2_SNAIL,4]

cutoff_4_K27ac<-quantile(log10(K27ac$V4))[4]
cutoff_2_K27ac<-quantile(log10(K27ac$V4))[2]
box_log_K27ac<-K27ac[log10(K27ac$V4) < cutoff_4_K27ac & log10(K27ac$V4) > cutoff_2_K27ac,4]

cutoff_4_ATAC<-quantile(log10(ATAC$V4))[4]
cutoff_2_ATAC<-quantile(log10(ATAC$V4))[2]
box_log_ATAC<-ATAC[log10(ATAC$V4) < cutoff_4_ATAC & log10(ATAC$V4) > cutoff_2_ATAC,4]

cutoff_4_AP2a<-quantile(log10(AP2a$V4))[4]
cutoff_2_AP2a<-quantile(log10(AP2a$V4))[2]
box_log_AP2a<-AP2a[log10(AP2a$V4) < cutoff_4_AP2a & log10(AP2a$V4) > cutoff_2_AP2a,4]

cutoff_4_p300<-quantile(log10(p300$V4))[4]
cutoff_2_p300<-quantile(log10(p300$V4))[2]
box_log_p300<-p300[log10(p300$V4) < cutoff_4_p300 & log10(p300$V4) > cutoff_2_p300,4]

cutoff_4_FoxP2cs<-quantile(log10(FoxP2cs$V4))[4]
cutoff_2_FoxP2cs<-quantile(log10(FoxP2cs$V4))[2]
box_log_FoxP2cs<-FoxP2cs[log10(FoxP2cs$V4) < cutoff_4_FoxP2cs & log10(FoxP2cs$V4) > cutoff_2_FoxP2cs,4]

cutoff_4_FoxP2sc<-quantile(log10(FoxP2sc$V4))[4]
cutoff_2_FoxP2sc<-quantile(log10(FoxP2sc$V4))[2]
box_log_FoxP2sc<-FoxP2sc[log10(FoxP2sc$V4) < cutoff_4_FoxP2sc & log10(FoxP2sc$V4) > cutoff_2_FoxP2sc,4]

cutoff_4_NR2F1<-quantile(log10(NR2F1$V4))[4]
cutoff_2_NR2F1<-quantile(log10(NR2F1$V4))[2]
box_log_NR2F1<-NR2F1[log10(NR2F1$V4) < cutoff_4_NR2F1 & log10(NR2F1$V4) > cutoff_2_NR2F1,4]

cutoff_4_K4me1<-quantile(log10(K4me1$V4))[4]
cutoff_2_K4me1<-quantile(log10(K4me1$V4))[2]
box_log_K4me1<-K4me1[log10(K4me1$V4) < cutoff_4_K4me1 & log10(K4me1$V4) > cutoff_2_K4me1,4]

cutoff_4_K4me3<-quantile(log10(K4me3$V4))[4]
cutoff_2_K4me3<-quantile(log10(K4me3$V4))[2]
box_log_K4me3<-K4me3[log10(K4me3$V4) < cutoff_4_K4me3 & log10(K4me3$V4) > cutoff_2_K4me3,4]

box<-list(
	data.frame(CTCF=box_CTCF),
	data.frame(RAD21=box_RAD21),
	data.frame(SLUG=box_SLUG),
	data.frame(SNAIL=box_SNAIL),
	data.frame(K27ac=box_K27ac),
	data.frame(ATAC=box_ATAC),
	data.frame(AP2a=box_AP2a),
	data.frame(p300=box_p300),
	data.frame(FoxP2cs=box_FoxP2cs),
	data.frame(FoxP2sc=box_FoxP2sc),
	data.frame(NR2F1=box_NR2F1),
	data.frame(K4me1=box_K4me1),
	data.frame(K4me3=box_K4me3)
)

box.m<-melt(box)

both<-list(
	data.frame(CTCF=length(CTCF$V4), group="all"),
	data.frame(RAD21=length(RAD21$V4), group="all"),
	data.frame(SLUG=length(SLUG$V4), group="all"),
	data.frame(SNAIL=length(SNAIL$V4), group="all"),
	data.frame(K27ac=length(K27ac$V4), group="all"),
	data.frame(ATAC=length(ATAC$V4), group="all"),
	data.frame(AP2a=length(AP2a$V4), group="all"),
	data.frame(p300=length(p300$V4), group="all"),
	data.frame(FoxP2cs=length(FoxP2cs$V4), group="all"),
	data.frame(FoxP2sc=length(FoxP2sc$V4), group="all"),
	data.frame(NR2F1=length(NR2F1$V4), group="all"),
	data.frame(K4me1=length(K4me1$V4), group="all"),
	data.frame(K4me3=length(K4me3$V4), group="all"),
	data.frame(CTCF=length(box_CTCF), group="box"),
	data.frame(RAD21=length(box_RAD21), group="box"),
	data.frame(SLUG=length(box_SLUG), group="box"),
	data.frame(SNAIL=length(box_SNAIL), group="box"),
	data.frame(K27ac=length(box_K27ac), group="box"),
	data.frame(ATAC=length(box_ATAC), group="box"),
	data.frame(AP2a=length(box_AP2a), group="box"),
	data.frame(p300=length(box_p300), group="box"),
	data.frame(FoxP2cs=length(box_FoxP2cs), group="box"),
	data.frame(FoxP2sc=length(box_FoxP2sc), group="box"),
	data.frame(NR2F1=length(box_NR2F1), group="box"),
	data.frame(K4me1=length(box_K4me1), group="box"),
	data.frame(K4me3=length(box_K4me3), group="box"),
	data.frame(CTCF=length(box_log_CTCF), group="box_log"),
	data.frame(RAD21=length(box_log_RAD21), group="box_log"),
	data.frame(SLUG=length(box_log_SLUG), group="box_log"),
	data.frame(SNAIL=length(box_log_SNAIL), group="box_log"),
	data.frame(K27ac=length(box_log_K27ac), group="box_log"),
	data.frame(ATAC=length(box_log_ATAC), group="box_log"),
	data.frame(AP2a=length(box_log_AP2a), group="box_log"),
	data.frame(p300=length(box_log_p300), group="box_log"),
	data.frame(FoxP2cs=length(box_log_FoxP2cs), group="box_log"),
	data.frame(FoxP2sc=length(box_log_FoxP2sc), group="box_log"),
	data.frame(NR2F1=length(box_log_NR2F1), group="box_log"),
	data.frame(K4me1=length(box_log_K4me1), group="box_log"),
	data.frame(K4me3=length(box_log_K4me3), group="box_log")
)

both.m<-melt(both)

pdf("500bp_flank_p300_intersect_WT_2_plots.pdf", height=15, width=15)

panelcor(dat, title="p300_500bp_flank")

ggplot(dat.m, aes(variable,value,fill=variable)) + geom_boxplot() + ggtitle("Signal over 500bp flanks p300")

ggplot(dat.m, aes(variable,log10(value),fill=variable)) + geom_boxplot() + ggtitle("log10(Signal) over 500bp flanks p300")

ggplot(both.m, aes(x=group, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) 


dev.off()
