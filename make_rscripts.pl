#!/usr/bin/env perl
use warnings;
use strict;

my ($metadata, $cell_type, $chrom_mark, $outscript) = @ARGV;
die "usage: <metadata> <cell type> <mark> <outfile.R>\n" unless @ARGV;

open(META, "<", $metadata) or die "could not open $metadata:$!\n";

my %data;
my @files;
while(<META>) {
	my $line = $_;
	chomp $line;
	next if ($line =~ /^file/);
		
	my ($file, $rep, $genome, $cell, $mark) = split(/\t/, $line);

	if ($cell eq $cell_type && $mark eq $chrom_mark) {
		push (@files, {file => $file, rep => $rep, cell => $cell, mark => $mark});			
	}
}

close META;

if (@files == 1) {
	die "only 1 replicate! [$files[0]{file}]\n";
}

open (R, ">", $outscript) or die "could not open $outscript:$!\n";
print R "library(reshape2)\nlibrary(ggplot2)\n\n";

for (my $i = 0; $i < @files; $i++) {
	my $R_var = $files[$i]{cell} . "_" . $files[$i]{rep} . "_" . $files[$i]{mark};
	print R "$R_var<-read.delim(\"$files[$i]{file}\", header=F)
$R_var<-$R_var\$V4
";

}

for (my $i = 0; $i < @files - 1; $i++) {
	for (my $j = 1; $j < @files; $j++) {
		my $R_var1 = $files[$i]{cell} . "_" . $files[$i]{rep} . "_" . $files[$i]{mark};
		my $R_var2 = $files[$j]{cell} . "_" . $files[$j]{rep} . "_" . $files[$j]{mark};
		print R "cat(paste0(\"$R_var1\", \"\\n\"))\n";
		print R "cat(paste0(\"$R_var2\", \"\\n\"))\n";
		print R "corr<-cor($R_var1, $R_var2, method=\"pearson\")\ncat(paste0(corr,\"\\n\"))\n";
		print R "corr<-cor($R_var1, $R_var2, method=\"spearman\")\ncat(paste0(corr,\"\\n\"))\n";
		print R "\npng(\"$outscript-$i-$j.png\")\n";
		print R "plot($R_var1, $R_var2)\n";
		print R "dev.off()\n";
	}
}
