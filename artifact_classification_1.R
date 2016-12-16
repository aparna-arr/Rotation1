library(mixtools)
library(reshape)
library(ggplot2)

# samples
# center, rep
CTCF<-read.delim("rep_p300_mapwig/0_hg19_WT_CTCF_rep_hg19_WT_p300_peaks.mapwig", header=F)
SLUG<-read.delim("rep_p300_mapwig/0_hg19_WT_SLUG_rep_hg19_WT_p300_peaks.mapwig", header=F)
K27ac<-read.delim("rep_p300_mapwig/MERGE_1_2_0_R_ori_rep__hg19_WT_K27ac_rep_hg19_WT_p300_peaks.mapwig", header=F)
p300<-read.delim("rep_p300_mapwig/MERGE_PE_ori_rep__hg19_WT_p300_rep_hg19_WT_p300_peaks.mapwig", header=F)
FoxP2sc<-read.delim("rep_p300_mapwig/ori_hg19_WT_FoxP2sc_rep_hg19_WT_p300_peaks.mapwig", header=F)

CTCF<-CTCF$V4
SLUG<-SLUG$V4
K27ac<-K27ac$V4
p300<-p300$V4
FoxP2sc<-FoxP2sc$V4

# inputs

input_CTCF<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/0_hg19_WT_INPUT_CTCF_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_SLUG<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/0_hg19_WT_INPUT_SLUG_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_K27ac<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/MERGE_1_2_0_R_rep_ori__hg19_WT_INPUT_K27ac_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_p300<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/MERGE_rep_PE_ori__hg19_WT_INPUT_p300_rep_hg19_WT_p300_peaks.mapwig", header=F)
input_FoxP2sc<-read.delim("/data1/aparna/enhancer_data/analysis/mergefiles/WT_hg19_merge_out/INPUT_p300_WT_mapwigs_rep/ori_hg19_WT_INPUT_FoxP2sc_rep_hg19_WT_p300_peaks.mapwig", header=F)

input_CTCF<-input_CTCF$V4
input_SLUG<-input_SLUG$V4
input_K27ac<-input_K27ac$V4
input_p300<-input_p300$V4
input_FoxP2sc<-input_FoxP2sc$V4

scatter<-list(
	data.frame(Mark="CTCF", Sample=log10(CTCF), Input=log10(input_CTCF), fold=log10(CTCF)/log10(input_CTCF)),
	data.frame(Mark="SLUG", Sample=log10(SLUG), Input=log10(input_SLUG), fold=log10(SLUG)/log10(input_SLUG)),
	data.frame(Mark="K27ac", Sample=log10(K27ac), Input=log10(input_K27ac), fold=log10(K27ac)/log10(input_K27ac)),
	data.frame(Mark="p300", Sample=log10(p300), Input=log10(input_p300), fold=log10(p300)/log10(input_p300)),
	data.frame(Mark="FoxP2sc", Sample=log10(FoxP2sc), Input=log10(input_FoxP2sc), fold=log10(FoxP2sc)/log10(input_FoxP2sc))
)

scatter.m<-melt(scatter)

# adding pseudocount to input to avoid INF
CTCF_fold<-(CTCF)/(input_CTCF)
CTCF_fold[is.infinite(CTCF_fold) == TRUE] <- NA
CTCF_fold<-na.omit(CTCF_fold)
CTCF_fold.m<-melt(CTCF_fold)

CTCF_fold.log<-abs(log10(CTCF_fold))
CTCF_fold.log[is.infinite(CTCF_fold.log) == TRUE] <- NA
CTCF_fold.log<-na.omit(CTCF_fold.log)
CTCF_fold.log.m<-melt(CTCF_fold.log)

SLUG_fold<-(SLUG)/(input_SLUG)
SLUG_fold[is.infinite(SLUG_fold) == TRUE] <- NA
SLUG_fold<-na.omit(SLUG_fold)
SLUG_fold.m<-melt(SLUG_fold)

SLUG_fold.log<-abs(log10(SLUG_fold))
SLUG_fold.log[is.infinite(SLUG_fold.log) == TRUE] <- NA
SLUG_fold.log<-na.omit(SLUG_fold.log)
SLUG_fold.log.m<-melt(SLUG_fold.log)

K27ac_fold<-(K27ac)/(input_K27ac)
K27ac_fold[is.infinite(K27ac_fold) == TRUE] <- NA
K27ac_fold<-na.omit(K27ac_fold)
K27ac_fold.m<-melt(K27ac_fold)

K27ac_fold.log<-abs(log10(K27ac_fold))
K27ac_fold.log[is.infinite(K27ac_fold.log) == TRUE] <- NA
K27ac_fold.log<-na.omit(K27ac_fold.log)
K27ac_fold.log.m<-melt(K27ac_fold.log)

p300_fold<-(p300)/(input_p300)
p300_fold[is.infinite(p300_fold) == TRUE] <- NA
p300_fold<-na.omit(p300_fold)
p300_fold.m<-melt(p300_fold)

p300_fold.log<-abs(log10(p300_fold))
p300_fold.log[is.infinite(p300_fold.log) == TRUE] <- NA
p300_fold.log<-na.omit(p300_fold.log)
p300_fold.log.m<-melt(p300_fold.log)

FoxP2sc_fold<-(FoxP2sc)/(input_FoxP2sc)
FoxP2sc_fold[is.infinite(FoxP2sc_fold) == TRUE] <- NA
FoxP2sc_fold<-na.omit(FoxP2sc_fold)
FoxP2sc_fold.m<-melt(FoxP2sc_fold)

FoxP2sc_fold.log<-abs(log10(FoxP2sc_fold))
FoxP2sc_fold.log[is.infinite(FoxP2sc_fold.log) == TRUE] <- NA
FoxP2sc_fold.log<-na.omit(FoxP2sc_fold.log)
FoxP2sc_fold.log.m<-melt(FoxP2sc_fold.log)

pdf("artifact_histograms.pdf")
ggplot(CTCF_fold.log.m, aes(x=value)) + geom_histogram(binwidth=range(CTCF_fold.log)[2]/500) + ggtitle("log fold CTCF/input")
ggplot(SLUG_fold.log.m, aes(x=value)) + geom_histogram(binwidth=range(SLUG_fold.log)[2]/500) + ggtitle("log fold SLUG/input")
ggplot(K27ac_fold.log.m, aes(x=value)) + geom_histogram(binwidth=range(K27ac_fold.log)[2]/500) + ggtitle("log fold K27ac/input")
ggplot(p300_fold.log.m, aes(x=value)) + geom_histogram(binwidth=range(p300_fold.log)[2]/500) + ggtitle("log fold p300/input")
ggplot(FoxP2sc_fold.log.m, aes(x=value)) + geom_histogram(binwidth=range(FoxP2sc_fold.log)[2]/500) + ggtitle("log fold FoxP2sc/input")

ggplot(CTCF_fold.m, aes(x=value)) + geom_histogram(binwidth=range(CTCF_fold)[2]/500) + ggtitle("fold CTCF/input")
ggplot(SLUG_fold.m, aes(x=value)) + geom_histogram(binwidth=range(SLUG_fold)[2]/500) + ggtitle("fold SLUG/input")
ggplot(K27ac_fold.m, aes(x=value)) + geom_histogram(binwidth=range(K27ac_fold)[2]/500) + ggtitle("fold K27ac/input")
ggplot(p300_fold.m, aes(x=value)) + geom_histogram(binwidth=range(p300_fold)[2]/500) + ggtitle("fold p300/input")
ggplot(FoxP2sc_fold.m, aes(x=value)) + geom_histogram(binwidth=range(FoxP2sc_fold)[2]/500) + ggtitle("fold FoxP2sc/input")

ggplot(CTCF_fold.log.m, aes(x=value)) + geom_density() + ggtitle("log fold CTCF/input")
ggplot(SLUG_fold.log.m, aes(x=value)) + geom_density() + ggtitle("log fold SLUG/input")
ggplot(K27ac_fold.log.m, aes(x=value)) + geom_density() + ggtitle("log fold K27ac/input")
ggplot(p300_fold.log.m, aes(x=value)) + geom_density() + ggtitle("log fold p300/input")
ggplot(FoxP2sc_fold.log.m, aes(x=value)) + geom_density() + ggtitle("log fold FoxP2sc/input")

ggplot(CTCF_fold.m, aes(x=value)) + geom_density() + ggtitle("fold CTCF/input")
ggplot(SLUG_fold.m, aes(x=value)) + geom_density() + ggtitle("fold SLUG/input")
ggplot(K27ac_fold.m, aes(x=value)) + geom_density() + ggtitle("fold K27ac/input")
ggplot(p300_fold.m, aes(x=value)) + geom_density() + ggtitle("fold p300/input")
ggplot(FoxP2sc_fold.m, aes(x=value)) + geom_density() + ggtitle("fold FoxP2sc/input")
dev.off()

pdf("ggplot_input_scatter_fold_colors.pdf")

ctcf_dat<-data.frame(myvar1=log10(CTCF), myvar2=log10(input_CTCF), fold=log10(CTCF)/log10(input_CTCF), color=rep(-2,length(CTCF)))

#ctcf_dat<-data.frame(myvar1=CTCF, myvar2=input_CTCF, fold=CTCF/input_CTCF, color=rep(-2,length(CTCF)))

ctcf_dat$color[ctcf_dat$fold > 0] <- 1
ctcf_dat$color[ctcf_dat$fold < 0] <- -1
ctcf_dat$color[ctcf_dat$fold == 0] <- 0


ctcf_dat[ctcf_dat$myvar1 == "-Inf" | ctcf_dat$myvar2 == "-Inf",] <- NA

ctcf.m<-melt(na.omit(ctcf_dat), id.vars=c("color", "myvar2", "myvar1"))


ggplot(ctcf.m, aes(x=myvar2, y=myvar1, col=factor(color))) + geom_point(shape=1)

dev.off()
