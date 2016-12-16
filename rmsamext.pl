#!/usr/bin/env perl

my ($file) = @ARGV;

my $old = $file;
$file =~ s/.sam//g;

`mv $old $file`;
