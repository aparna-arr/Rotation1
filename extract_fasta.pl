#!/usr/bin/env perl
use warnings;
use strict;

my ($fastadir, $enhancer_list, $outfile) = @ARGV;
die "usage: <fasta dir> <enhancer name list> <outfile name>\n" unless @ARGV;

opendir(DIR, $fastadir) or die "could not open dir $fastadir: $!\n";
my @fastas = grep(/^enhancer.+\.fa$/, readdir(DIR));
closedir DIR;

my %index;
for (my $i = 0; $i < @fastas; $i++) {
	$index{$fastas[$i]} = 1;
}

@fastas = ();

open (IN, "<", $enhancer_list) or die "could not open $enhancer_list:$!\n";

my @enhancers; 

while(<IN>) {
	my $line = $_;
	chomp $line;
	next if $line !~ /^enhancer/;

	if (!exists($index{"$line.fa"})) {
		warn "Enhancer $line has no fasta file!\n";
	}
	else {
		push(@enhancers, "$line");		
	}
}

close IN;

open (OUT, ">", $outfile) or die "could not open $outfile:$!\n";

for (my $i = 0; $i < @enhancers; $i++) {
	open (TMP, "<", "$fastadir/$enhancers[$i].fa") or die "could not open fasta $enhancers[$i]:$!\n";

	my $flag = 0;
	
	while(<TMP>) {
		my $line = $_;
		chomp $line;
	
		if ($flag >= 1 && $line !~ /^>/) {
			if ($flag == 1) {
				print OUT ">$enhancers[$i]\n";
			}

			print OUT $line;
			$flag++;
		}
		elsif ($flag >= 1) {
			print OUT "\n";
			last;
		}
		elsif ($line =~ /^>h9/) {
			$flag = 1;
		}
	}

	close TMP;
}

close OUT;
