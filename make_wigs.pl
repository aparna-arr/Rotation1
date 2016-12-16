#!/usr/bin/env perl
use warnings;
use strict;

my ($metadata, $cmdfile, $run_file) = @ARGV;
die "usage: <METADATA_FINAL> <cmd file> <run log file>" unless @ARGV;

open (META, "<", $metadata) or die "could not open $metadata:$!\n";
open (LOG, ">", $run_file) or die "could not open $run_file:$!\n";

my %run;

while(<META>) {
	my $line = $_;
	chomp $line;
	next if $line =~ /^file/;

	my ($bam, $rep, $genome, $cell, $mark) = split(/\t/, $line);
	next if ($genome eq "panTro3" || $cell eq "818" || $cell eq 1209);

	print LOG $line . "\n";

#	warn "$bam";	
	my ($name) = $bam =~ /^.*?\/*([^\/]+)$/;
	$name =~ s/.bam//;
	$name =~ s/-/_/;
#	warn "$name";
#	warn "[$bam]\n[$name]";
	$run{$bam} = {	
		name => $name,
		rep => $rep,
		genome => $genome,
		cell => $cell,
		mark => $mark
	};
}

close LOG;

close META;

open(CMD, ">", $cmdfile) or die "could not open $cmdfile:$!\n";
foreach my $bam (keys %run) {
#	warn "samtools -h $bam > $run{$bam}{name}.sam; /data1/aparna/Convert-Everything/convert-everything --sambin -i $run{$bam}{name}.sam -c wig -o $run{$bam}{name}.wig; rm $run{$bam}{name}.sam; /data1/aparna/MapWigToBed/mapwigtobed -d 0 -c /data1/aparna/CACHE/ -i $run{$bam}{name}.wig hg19_bins_1kb.bed\n";
	print CMD "samtools view -h $bam > $run{$bam}{name}.sam; /data1/aparna/Convert-Everything/convert-everything --sambin 10 -i $run{$bam}{name}.sam -c wig -o $run{$bam}{name}.wig; rm $run{$bam}{name}.sam; /data1/aparna/MapWigToBed/mapwigtobed -d 0 -c /data1/aparna/CACHE/ -i $run{$bam}{name}.wig hg19_bins_1kb.bed\n";
}
close CMD;
