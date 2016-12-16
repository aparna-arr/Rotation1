#!/usr/bin/env perl
use warnings;
use strict;

my ($metadata, $peak_dir, $cmd_outfile) = @ARGV;
die "usage: <MAnorm_metadata> <MACS peaks dir> <cmd_outfile_name>" unless @ARGV;

open(META, "<", $metadata) or die "cannot open $metadata:$!\n";

my @runs;
while(<META>) {
	my $line = $_;
	chomp $line;
	next if ($line =~ /^file/);

	my ($bam_sample, $rep, $genome, $cell, $mark, $bam_input) = split(/\t/, $line);

	push(@runs, {sample => $bam_sample, peaks => "$peak_dir/$rep\_$genome\_$cell\_$mark\_peaks.xls", control => $}
}

close META;
