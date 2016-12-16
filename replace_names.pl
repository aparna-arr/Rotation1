#!/usr/bin/env perl
use warnings;
use strict;

my ($file, $conv, $outfile) = @ARGV;
die "usage: <file with old names as 1st col> <2 col file with new names as 2nd col> <outfile name>\n" unless @ARGV == 3;

open(IN, "<", $conv) or die "could not open $conv\n";

my %namehash;
while(<IN>) {
	my $line = $_;
	chomp $line;
	
	my ($nameOld, $nameNew) = $line =~ /^(\S+)\t(\S+).*$/;
#	warn "nameOld is $nameOld, nameNew is $nameNew";

	$namehash{$nameOld} = $nameNew;
}

close IN;

open (IN, "<", $file) or die "could not open $file\n";

my %results;
my $header = "";
while(<IN>) {
	my $line = $_;
	chomp $line;
	
	my ($name, $linePart) = $line =~ /^(\S+)\t(.+)/;
#	warn "old name in file is $name, linepart is $linePart";

	if ($name =~ /enhancer_name/) {
		$header = "$line\n";
		next;
	}

	if (!exists($namehash{$name})) {
		warn "OldName $name has no NewName!";
		$results{$name} = "$name\t$linePart\n";	
		next;
	}

	$results{$namehash{$name}} = "$namehash{$name}\t$linePart\n";	
}

close IN;

open (OUT, ">", $outfile) or die "could not open $outfile\n";
print OUT $header;
foreach my $elem (sort keys %results) {
	print OUT $results{$elem};
}

close OUT;
