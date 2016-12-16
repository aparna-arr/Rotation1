args = commandArgs(trailingOnly=TRUE)

file<-args[1]

peaks<-read.delim(args[1], header=F)
head(peaks)

pval_quant<-quantile(peaks$V7)

sig_peaks<-peaks[peaks$V7 > pval_quant[2],c(1,2,3,6)]

nrow(peaks)
nrow(sig_peaks)
write.table(sig_peaks, file=paste0(file,".sig.bedgraph"), sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
