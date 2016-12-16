#!/usr/bin/perl
use strict; use warnings;
use Thread;
use Thread::Queue;

my ($file, $numThreads) = @ARGV;
die "usage: <1 command per line> <number of threads>" unless @ARGV;

my $Q = new Thread::Queue;

open (IN, "<", $file) or die "could not open $file\n";

while(<IN>) {
	my $line = $_;
#	print "[$line]\n";
	chomp $line;
	$Q->enqueue($line);
}
close IN;
$Q->end;


my @threads;
for (my $i = 0; $i < $numThreads; $i++) {
	print "starting thread $i\n";
	$threads[$i] = threads->create(\&worker, $i, $Q);
}

for (my $i = 0; $i < $numThreads; $i++) {
	$threads[$i]->join();
}

sub worker {
	my ($thread, $queue) = @_;
	my $thread_id = threads->tid;
	
	while ($queue->pending) {
		my $command = $queue->dequeue;
		system($command);
		print "$thread_id: RUNNING $command\n";
	}
	return;
}

