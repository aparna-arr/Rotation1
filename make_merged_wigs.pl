#!/usr/bin/env perl
use warnings;
use strict;

my ($metadata, $outdir) = @ARGV;
die "usage: <bam metadata file> <name for outdir>
metadata file MUST have only mark and replicate variable
all other attributes (cell type, genome, species) MUST be constant

This script merges bam files of replicates of the same mark
it does NOT use input as a control
it produces wig file output
if a mark has no reps, it will produce a wig file anyway
" unless @ARGV;

open(META, "<", $metadata) or die "could not open $metadata:$!\n";

my %files;
my $const = "";
while(<META>) {	
	my $line = $_;
	chomp $line;
	next if $line =~ /^file/;

	my ($file, $rep, $genome, $cell, $mark, $input) = split(/\t/, $line);
	
	push(@{$files{$mark}}, {rep => $rep, file => $file}); # notice how this does NO CHECKS AT ALL
				    			      # MAKE SURE OTHER VARS ARE CONSTANT
      	if ($const eq "") {
		$const = "$genome\_$cell";
	}			        
}

close META;

my @bams;
`mkdir tmp`;
foreach my $mark (keys %files) {

	if (@{$files{$mark}} > 1) {
		warn "Merging multiple reps for mark $mark";
		my $filestr = "";
		my $repstr = "";
		my $headerfile = "";

		foreach my $reps (@{$files{$mark}}) {
			warn "rep $reps->{rep}";
			`samtools sort $reps->{file} > tmp/$reps->{rep}_$mark.tmp;`;
			$filestr .= "tmp/$reps->{rep}_$mark.tmp ";
			$repstr .= $reps->{rep} . "_";
			if ($headerfile eq "") {
				`samtools view -H $reps->{file} > myheader.sam`;
				$headerfile = "myheader.sam"
			}
		}
	
		my $mergebam = "MERGE_$repstr\_$const\_$mark.bam";
		my $mergename = "MERGE_$repstr\_$const\_$mark";
	
		push(@bams, {bam => $mergebam, basename => $mergename});

		`samtools merge tmp/$mergebam.nosort $filestr`;
		`samtools sort tmp/$mergebam.nosort > $mergebam`;
	}
	else {
		warn "no reps for mark $mark";
		my $name = "$files{$mark}[0]{rep}_$const\_$mark";
		`samtools sort $files{$mark}[0]{file} > $name.bam`;
		push (@bams, {bam => $files{$mark}[0]{file}, basename => $name});
	}

}

`mkdir $outdir`;

foreach my $bamfile (@bams) {
	`samtools view -h $bamfile->{bam} > $bamfile->{basename}.sam`;	
	`convert-everything --sambin 10 -i $bamfile->{basename}.sam -c wig -o $outdir/$bamfile->{basename}.wig`;
}
