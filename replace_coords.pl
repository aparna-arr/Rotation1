#!/usr/bin/env perl
use warnings;
use strict;

my ($file200, $file500, $outfile) = @ARGV;
die "usage: <200bp reduced enhancers file> <500 bp human_chimp file> <outfile name>\n" unless @ARGV == 3;

open (IN, "<", $file500) or die "could not open $file500: $!\n";

my %sub_hash;

while(<IN>) {
	my $line = $_;
	chomp $line;
	my @elements = split(/\t/, $line);
	
	if (!exists($sub_hash{$elements[3]})) {

		$sub_hash{$elements[3]}{chrom} = $elements[0];
		$sub_hash{$elements[3]}{start} = $elements[1];
		$sub_hash{$elements[3]}{end} = $elements[2];

#		%{$sub_hash{$elements[3]}} = (
#			start => $elements[1],
#			end => $elements[2],
#			chrom => $elements[0]
#		)
	}
	else {
		die "ELEMENT [$elements[3]] HAS A DUPLICATE\n";
	}
}

close IN;

open (IN, "<", $file200) or die "could not open $file200:$!\n";

my @output;
my $output_line = 0;

while(<IN>) {
	my $line = $_;
	chomp $line;

	if ($line =~ /^Name/) {
		$output[$output_line] = $line;
		$output_line++;
		next;
	}

	my @elem200 = split(/\t/, $line);

#	warn "$elem200[0]\n";
	
	if (!exists($sub_hash{$elem200[0]})) {
		die "ELEMENT [$elem200[0]] DOES NOT HAVE A 500bp COORD\n";
	}

	if ($sub_hash{$elem200[0]}{chrom} eq $elem200[8]) {
		$elem200[9] = $sub_hash{$elem200[0]}{start};
		$elem200[10] =  $sub_hash{$elem200[0]}{end};
		$output[$output_line] = join("\t", @elem200);
		$output_line++;
	}
	else {
		die "CHROM DO NOT MATCH ELEM: [$elem200[0]]\n";
	}

}

close IN;

open(OUT, ">", $outfile) or die "could not open $outfile: $!\n";

for (my $i = 0; $i < $output_line; $i++) {	
#	print $output[$i] . "\n";
	print OUT $output[$i] . "\n";
}

close OUT;
