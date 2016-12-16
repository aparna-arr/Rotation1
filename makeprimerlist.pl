#!/usr/bin/env perl
use warnings;
use strict;

my ($failed_ext, $failed_spec, $all_ext, $all_spec, $outfile) = @ARGV;
die "usage: <FAILED_EXTENDED dir> <FAILED_SPECIFIC dir> <PRIMERS_EXTENDED dir> <PRIMERS_SPECIFIC dir>\n" unless @ARGV == 5;

opendir(ALL_S, $all_spec);
my @all_specific = readdir(ALL_S);
closedir ALL_S;

opendir(ALL_E, $all_ext);
my @all_extended = readdir(ALL_E);
closedir ALL_E;

if (@all_specific != @all_extended) {
	die "$all_ext and $all_spec have different numbers of files!\n";
}

my @enhancers;

for my $elem (@all_specific) {
	next if $elem =~ /^\.|\.\.$/;	

#	warn "elem is $elem";
	my ($name) = $elem =~ /PRIMERS_(.+)\.out$/;
#	warn "name is $name";

	my $s = ".\t.";
	my $e = ".\t.";

	if ( ! -f "$failed_spec/FAILED_INFILE_$name") {
		open(SPEC, "<", "$all_spec/PRIMERS_$name.out");
	
		while(<SPEC>) {
			my $line = $_;
			chomp $line;
			if ($line =~ /PRIMER_LEFT_0_SEQUENCE/) {
				($s) = $line =~ /PRIMER_LEFT_0_SEQUENCE=(.+)/;
			}
			elsif ($line =~ /PRIMER_RIGHT_0_SEQUENCE/) {
				my ($right) = $line =~ /PRIMER_RIGHT_0_SEQUENCE=(.+)/;
				$s .= "\t$right";
				last;
			}
		}		
			
		close SPEC;	
	}

	if ( ! -f "$failed_ext/FAILED_INFILE_$name") {
		open(EXT, "<", "$all_ext/PRIMERS_$name.out");
	
		while(<EXT>) {
			my $line = $_;
			chomp $line;
			if ($line =~ /PRIMER_LEFT_0_SEQUENCE/) {
				($e) = $line =~ /PRIMER_LEFT_0_SEQUENCE=(.+)/;
			}
			elsif ($line =~ /PRIMER_RIGHT_0_SEQUENCE/) {
				my ($right) = $line =~ /PRIMER_RIGHT_0_SEQUENCE=(.+)/;
				$e .= "\t$right";
				last;
			}
		}		
			
		close EXT;	
	}

	push(@enhancers, "$name\t$s\t$e\n");
}


open (OUT, ">", $outfile) or die "could not open $outfile: $!\n";
print OUT "enhancer_name\tleft_specific_primer\tright_specific_primer\tleft_extended_primer\tright_extended_primer\n";
for my $enhancer (sort @enhancers) {
	print OUT $enhancer;
}

close OUT;
