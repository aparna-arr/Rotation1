#!/usr/bin/env perl
use warnings;
use strict;

my ($name_conv, $wells, $outfile) = @ARGV;
die "usage: <enhancer_name_conv.txt> <pcr_wells.txt> <outfile>\n" unless @ARGV;

open(IN, "<", $wells) or die "could not open $wells:$!\n";

my %well_conv;
while(<IN>) {
	my $line = $_;
	chomp $line;
	my ($well, $hg19) = split(/\t/, $line);	
	$well_conv{$hg19} = $well;
}

close IN;


open(IN, "<", $name_conv) or die "could not open $name_conv:$!\n";

my %enhancers;
while(<IN>) {
	my $line = $_;
	chomp $line;
	next if $line =~ /^Name/;

	my ($enhancer, $hg19) = split(/\t/, $line);
	my ($hg19_start) = $hg19 =~ /^(.+)-.+$/;

	next if (!exists($well_conv{$hg19_start})); 
#	warn "[$hg19_start][$well_conv{$hg19_start}]";

	$enhancers{$enhancer}{hg19} = $hg19;
	$enhancers{$enhancer}{well} = $well_conv{$hg19_start};
}

close IN;

open(OUT, ">", $outfile) or die "could not open $outfile\n";

foreach my $e (sort keys %enhancers) {
	print OUT "$e\t$enhancers{$e}{hg19}\t$enhancers{$e}{well}\n";
}

close OUT;
