#!/usr/bin/env perl
use warnings;
use strict;

my ($dir1, $dir2) = @ARGV;
die "usage: <dir1> <dir2>\n" unless @ARGV == 2;

opendir(DIR1, $dir1) or die "could not open $dir1: $!\n";

my @files1 = readdir(DIR1);

closedir(DIR1);

opendir(DIR2, $dir2) or die "could not open $dir2: $!\n";

my @files2 = readdir(DIR2);

closedir(DIR2);

my %lookup1 = map { $_ => undef } @files1;

my @shared;

print "Unique to $dir2:\n";

for my $elem (@files2) {
	if (exists($lookup1{$elem})) {
		push (@shared, $elem);	
		delete $lookup1{$elem};
	}
	else {
		print "$elem\n";
	}
}

print "\nUnique to $dir1:\n";
foreach my $elem1 (sort keys %lookup1) {
	print "$elem1\n";
}

print "\nShared:\n";
for my $share (@shared) {
	print "$share\n";
}
