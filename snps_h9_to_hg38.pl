#!/usr/bin/env perl
use warnings;
use strict;

srand(1);

my ($fasta, $snpfile, $outfile) = @ARGV;
die "usage: <FASTA of sequences, header being position> <bed format SNP file: /data1/jaavedm/workspace/gatk/bed/H9.bed> <outfile>\n" unless @ARGV;

open (IN, "<", $fasta) or die "could not open $fasta: $!\n";

my %seqs;
my $curr_chr = "INIT";
my $ar_pos = 0;
while(<IN>) {
	my $line = $_;
	chomp $line;

#	warn "DEBUG LINE: [$line]\n";
	
	if ($line =~ />/) {
		my ($chr, $start, $end) = $line =~ /^>(.+):(\d+)-(\d+)$/;
		if (!defined($start))
		{
			die "START NOT DEFINED\n";
		}

#		warn "CHR [$chr] START [$start] END [$end]\n";
#		warn "DEBUG: line is [$line] chr is [$chr] start is [$start] end is [$end]\n";
		$curr_chr = $chr;
		push(@{$seqs{$chr}}, {start => $start, end => $end, seq => ''});
		$ar_pos = @{$seqs{$chr}} - 1;	
	}
	elsif ($curr_chr ne "INIT") {
		$seqs{$curr_chr}[$ar_pos]{seq} .= $line;	 	
	}
	else {
		die "POSSIBLE HEADER LINE? ERROR: CHR IS INIT AND LINE !~ />/\n";
	}
}

close IN;

open (BED, "<", $snpfile) or die "could not open $snpfile: $!\n";

my $curr_index = 0;
$curr_chr = "INIT";

while (<BED>) {
	my $line = $_;
	chomp $line;

	my ($chr, $start, $end, $snp, $score, $strand) = split(/\t/, $line);

	if ($curr_chr ne $chr) {
		$curr_index = 0;
		$curr_chr = $chr;
	}

	if (!exists($seqs{$chr})) {
		next;
	}

	while ($curr_index < @{$seqs{$chr}} && $seqs{$chr}[$curr_index]{end} <= $start) {
		$curr_index++;
	}

	if ($curr_index >= @{$seqs{$chr}} || $seqs{$chr}[$curr_index]{start} > $start) {

#		warn "NEXT on chr $chr\n";
		next;
	}

	my ($orig_base, $new_base) = split(/_/, $snp);

	my $rel_pos = $start - $seqs{$chr}[$curr_index]{start};

	if ($rel_pos < 0) {
		die "ERROR rel pos is < 0\n";
	}

	if ($new_base !~ /[ACGT]/) {
		$new_base = pick_base($orig_base, $new_base);
	}

	if (substr($seqs{$chr}[$curr_index]{seq}, $rel_pos, 1) ne $orig_base) {
		if (substr($seqs{$chr}[$curr_index]{seq}, $rel_pos,1) ne lc($orig_base)) {
			die "ORIG_BASE in fasta is " . substr($seqs{$chr}[$curr_index]{seq}, $rel_pos, 1) . " in file $orig_base!\n";
		}
		else {
			if ($new_base !~ /[ACGT]/) {
				$new_base = lc(pick_base(uc($orig_base), $new_base));
			}
			else {
				$new_base = lc($new_base);
			}
		}
		
	}	
	warn "BASE SWITCH $orig_base $new_base\n";
	substr($seqs{$chr}[$curr_index]{seq}, $rel_pos, 1) = $new_base;
}

close BED;

open (OUT, ">", $outfile) or die "could not open $outfile: $!\n";

foreach my $chrom (sort keys %seqs) {
	for (my $i = 0; $i < @{$seqs{$chrom}}; $i++) {
#		warn "i is $i\n";
#		warn ">$chrom:$seqs{$chrom}[$i]{start}-$seqs{$chrom}[$i]{end}\n";
		print OUT ">$chrom:$seqs{$chrom}[$i]{start}-$seqs{$chrom}[$i]{end}\n";
		print OUT "$seqs{$chrom}[$i]{seq}\n";
	}
}	

close OUT;

#TEST_pick_base();

sub TEST_pick_base {
	warn "ORIG: A, NEW: R";	
	print "OUTPUT: [" . pick_base("A", "R") . "]\n";
	warn "ORIG: C, NEW: B";	
	print "OUTPUT: [" . pick_base("C", "B") . "]\n";
	warn "ORIG: C, NEW: N";	
	print "OUTPUT: [" . pick_base("C", "N") . "]\n";
}


sub pick_base {
	my $orig = $_[0];
	my $new = $_[1];

	my %ref = (
		R => "AG",
		Y => "CT",
		S => "GC",
		W => "AT",
		K => "GT",
		M => "AC",
		B => "CGT",
		D => "AGT",
		H => "ACT",
		V => "ACG",
		N => "ACGT"
	);

	die "SNP [$new] DOES NOT EXIST\n" if (!exists($ref{$new}));
	warn "BEFORE str is [$ref{$new}]\n";

	$ref{$new} =~ s/$orig//g;

	warn "AFTER str is [$ref{$new}]\n";
	my @ar = split(//, $ref{$new});
	return($ar[int(rand(@ar))]);
}
