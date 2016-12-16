#!/usr/bin/env perl
use warnings;
use strict;

my ($fa_file, $names_file, $faileddir, $allprimersdir) = @ARGV;
die "usage: <fa file of regions> <bed file with names> <Failed outdir name> <all primers outdir name>\n" unless @ARGV == 4 ;

`mkdir $allprimersdir`;
`mkdir $faileddir`;

open (FA, "<", $fa_file) or die "could not open $fa_file\n";

my @fa_seqs;
while(<FA>) {
	my $line = $_;
	chomp $line;
	
	if ($line =~ />/) {
		my ($chr, $start, $end) = $line =~ /^>(.+):(\d+)-(\d+)$/;
	
		push (@fa_seqs, {chr => $chr, start => $start, end => $end});
	}	
	else {
		$fa_seqs[@fa_seqs - 1]{seq} = $line;
	}
}

close FA;

my @names;

open(BED, "<", $names_file) or die "could not open $names_file: $!\n";

while(<BED>) {
	my $line = $_;
	chomp $line;

	my ($chr, $start, $end, $name) = split(/\t/, $line);
	
	push (@names, {chr => $chr, start => $start, end => $end, name => $name});
	if ($names[@names - 1]{chr} ne $fa_seqs[@names-1]{chr} || $names[@names-1]{start} != $fa_seqs[@names - 1]{start} || $names[@names - 1]{end} != $names[@names - 1]{end}) {
		@names = ();
		last;
	}
}

close BED;

my $pos_as_name = 0;

if (@names != @fa_seqs) {
	warn "names array does not match length of fa_seqs array, using pos as SEQUENCE ID! names [" . @names . "] seqs [" . @fa_seqs . "]\n";

	$pos_as_name = 1;
}


for (my $i = 0; $i < @fa_seqs; $i++) {

	my $name = "";
	if ($pos_as_name == 1) {
		$name = "$fa_seqs[$i]{chr}:$fa_seqs[$i]{start}-$fa_seqs[$i]{end}";
	}
	else {
		$name = $names[$i]{name};
	}	

	my $curr_start = 500;
	my $flag = 1;
	my $direction = 0;
	my $mult = 2;
	my $lower_bound = 400;	
	my $upper_bound = 600;

	while ($flag == 1 && $curr_start >= $lower_bound && $curr_start <= $upper_bound) {
		open (TMP, ">", "primer_tmp_infile") or die "could not open tmp outfile: $!\n";
		print TMP "SEQUENCE_ID=$name\n";
		print TMP "SEQUENCE_TEMPLATE=$fa_seqs[$i]{seq}
SEQUENCE_INCLUDED_REGION=$curr_start,500
PRIMER_TASK=pick_cloning_primers
PRIMER_PRODUCT_SIZE_RANGE=500-500
PRIMER_PICK_LEFT_PRIMER=1
PRIMER_PICK_RIGHT_PRIMER=1
PRIMER_OPT_SIZE=24
PRIMER_MIN_SIZE=20
PRIMER_MAX_SIZE=30
PRIMER_EXPLAIN_FLAG=1
PRIMER_OPT_GC_PERCENT=60.0
PRIMER_MIN_GC=40.0
PRIMER_MAX_GC=75.0
=
";

		close TMP;

		`primer3_core < primer_tmp_infile > $allprimersdir/PRIMERS_$name.out`;

		open (PRIM, "<", "$allprimersdir/PRIMERS_$name.out") or die "could not open $allprimersdir/PRIMERS_$name.out! $!\n";

		while(<PRIM>) {
			my $line = $_;
			grep $line;	
			if ($line =~ /^PRIMER_PAIR_NUM_RETURNED/) {
				my ($num) = $line =~ /=(\d+)$/;
				if ($num > 0) {
					print "PRIMERS FOUND: $name\n";
					$flag = 0;
				}
				else {
					if ($direction == 0) {
						$direction = 1;
						$curr_start -= $mult;	
					}
					elsif ($direction == 1) {
						$direction = 0;
						$curr_start += $mult;
					}
					$mult += 2;
					print "NO PRIMERS: $name. Setting start to $curr_start\n";

					if ($curr_start < $lower_bound || $curr_start > $upper_bound) {
						warn "OUT OF BOUNDS: $name. NO PRIMERS\n";
						`mv primer_tmp_infile $faileddir/FAILED_INFILE_$name`;
					}
				}
				
				last;
			}
		}
		
		close PRIM;
	}
}

