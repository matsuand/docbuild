#!/usr/bin/perl

use strict;

if (@ARGV < 1) {
  print STDERR "Missing argument\n";
  exit(1);
} elsif (@ARGV > 1) {
  print STDERR "Too many argument\n";
  exit(1);
}

my $src_path = $ARGV[0];  # source file

if (!-f $src_path) {
  print STDERR "File not found: $src_path\n";
  exit(1);
}

if ($? == -1) {
  print STDERR "Error occured to rename input file\n";
  exit(1);
}

open (my $fh_src, '<'.$src_path) or die "Error: " . $src_path;

my $line_cnt = 0;
my $lines = "";
my $phase = 0; # 0: normal, 1: @x, 2: @y

my $first = 0;
my @xlines;
my @ylines;
my $x_cnt;
my $y_cnt;

my $total_x = 0;
my $total_trans = 0;

foreach my $line (<$fh_src>) {

  $line_cnt++;

  my $keywd = "";
  if (length($line) > 1) {
    $keywd = substr($line, 0, 2);
  }

  if ($phase == 0) {
    if ($keywd eq "\@x") {
      $phase = 1; $first = 1;
      @xlines = (); $x_cnt = 0;
      $xlines[$x_cnt++] = $line;
    } elsif ($keywd eq "\@y" or $keywd eq "\@z") {
      print STDERR "Broken keyword in L." . $line_cnt . "!\n";
    }
  } elsif ($phase == 1) {
    if ($keywd eq "\@y") {
      $phase = 2;
      @ylines = (); $y_cnt = 0;
      $ylines[$y_cnt++] = $line;
    } elsif ($keywd eq "\@x" or $keywd eq "\@z") {
      print STDERR "Broken keyword in L." . $line_cnt . "!\n";
    } else {
      $xlines[$x_cnt++] = $line;
    }
  } elsif ($phase == 2) {
    if ($keywd eq "\@z") {
      $phase = 0;
    } elsif ($keywd eq "\@x" or $keywd eq "\@y") {
      print STDERR "Broken keyword in L." . $line_cnt . "!\n";
    } else {
      $ylines[$y_cnt++] = $line;
    }
  }

  if ($phase == 0 and $first == 1) {

    my $xlen = @xlines - 1;
    my $trans_cnt = 0;

    for (my $elm = 0; $elm < $xlen; $elm++) {
      if ($xlines[$elm] ne $ylines[$elm]) {
        $trans_cnt++;
      }
    }
    $total_trans += $trans_cnt;
    $total_x     += $xlen;
    $first = 0;
  }
}

printf "%s\t%d\t%d\n", $src_path, $total_x, $total_trans;

close($fh_src);
