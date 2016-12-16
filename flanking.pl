#!/usr/bin/env perl
use warnings;
use strict;

my ($infile, $flank, $outfile) = @ARGV;
die "usage: <infile 3col bed> <total bp to flank> <outfile>\n" unless @ARGV;

open(IN, "<", $infile) or die "could not open $infile:$!\n";
open(OUT, ">", $outfile) or die "could not open $outfile:$!\n";

while(<IN>) {
	my $line = $_;
	chomp $line;
	
	my ($chr, $start, $end) = split(/\t/, $line);

	print OUT "$chr\t" . ($start - $flank) . "\t$start\n";
	print OUT "$chr\t$end\t" . ($end + $flank) . "\n";
}
close OUT;
close IN;
