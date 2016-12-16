#!/usr/bin/env perl
use warnings;
use strict;

my ($rlog, $outfile) = @ARGV;
die "usage: <Rlog data file> <outfile>\n" unless @ARGV;

open (IN, "<", $rlog) or die "could not open $rlog\n";

my $flag = 0;
my @labels;
my @data;
my $new_header = "";
my $row = 0;
while(<IN>) {
	my $line = $_;
	chomp $line;

	if ($flag == 0) {
		$flag = 1;
		my (@headerline) = split(/\s+/, $line);	
		foreach my $colname (@headerline) {
			$colname =~ s/"//g;
			my ($cell, $rep, $mark, $genome) = split(/_/, $colname);
			push(@labels, "$cell\t$rep\t$mark\t$genome");
		}	
		$new_header = "Row#\tCell\tRep\tMark\tGenome\tAvgSig\n";
		push (@data, $new_header);
		next;
	}
	$row++;
	my (@cols) = split(/\s+/, $line);
	
	for (my $i = 0; $i < @cols; $i++) {
		push(@data, "$row\t$labels[$i]\t$cols[$i]\n");
	}

}

close IN;

open(OUT, ">", $outfile) or die "could not open $outfile\n";

foreach my $lines (@data) {
	print OUT $lines;
}

close OUT;
