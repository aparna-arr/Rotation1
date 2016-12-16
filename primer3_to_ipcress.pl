#!/usr/bin/env perl
use warnings;
use strict;

my ($dir, $outfile) = @ARGV;
die "usage: <primer3 outfile dir> <outfile>" unless @ARGV;

opendir(DIR, $dir);
my @files = readdir(DIR);
closedir(DIR);

my @outstrings;

for my $file (@files) {
	open(IN, "<", "$dir/$file") or die "could not open $file\n";

	my $enhancer = "";
	my $left = "";
	my $right = "";
	my $exists = 0;

	while(<IN>) {
		my $line = $_;	
		chomp $line;
		
		if ($line =~ /SEQUENCE_ID=/) {
			($enhancer) = $line =~ /SEQUENCE_ID=(.+)/;
		}

		if ($line =~ /PRIMER_LEFT_0_SEQUENCE=/) { 
			$exists = 1;
			($left) = $line =~ /PRIMER_LEFT_0_SEQUENCE=(.+)/;
		}
		elsif ($line =~ /PRIMER_RIGHT_0_SEQUENCE=/) { 
			$exists = 1;
			($right) = $line =~ /PRIMER_RIGHT_0_SEQUENCE=(.+)/;
		}
	}	

	close IN;

	if ($exists == 1) {
		push(@outstrings, "$enhancer $left $right 300 1700\n");
	}
}

open (OUT, ">", $outfile) or die "could not open $outfile: $!\n";

for my $str (@outstrings) {
	print OUT $str;
}

close OUT;
