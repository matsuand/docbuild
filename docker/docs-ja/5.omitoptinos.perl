#!/usr/bin/perl

use strict;

if (@ARGV < 1) {
  print "Missing argument\n";
  exit(1);
} elsif (@ARGV > 1) {
  print "Too many argument\n";
  exit(1);
}

my $src_path = $ARGV[0];  # source file
my $tgt_path = $src_path; # omit file

if (!-f $src_path) {
  print "File not found: $src_path\n";
  exit(1);
}

# 入力ファイルに拡張子 ".tmp" をつける
system("mv $src_path $src_path" . ".tmp");

if ($? == -1) {
  print "Error occured to rename input file\n";
  exit(1);
}

open (my $fh_src, '<'.$src_path . ".tmp") or die "Error: " . $src_path;
open (my $fh_tgt, '>'.$tgt_path) or die "error: $!";

my $lines = "";
my $found = 0; # not found
my $len;
my $blanks;
my $opt;
my $desr;

foreach my $line (<$fh_src>) {

  if ($found >= 1) {

    if ($found == 2) {
      if (substr($line, 0, $len+1) eq $blanks." ") {

        print $fh_tgt $line;

      } else {

        $found = 1;

      }

    } elsif (($found == 1) and (substr($line, 0, $len) eq $blanks)) {

      if (substr($line, $len, 12) eq "description:") {

        $desr = $line;
        print $fh_tgt $desr;
        $found = 2;

      } else {

        $found = 1;

      }

    } else {

      print $fh_tgt "\@y\n";
      print $fh_tgt  $desr;
      print $fh_tgt "\@z\n";
      $found = 0;

    }
  }

  if ($line =~ /([ \t]*)- option: (.*)$/) {

     $len = length($1) + 2;
     $blanks = " " x $len;
     $opt = $2;

     print $fh_tgt "\n\@x " . $opt . "\n";

     $found = 1; # option line found

  } elsif ($found == 0) {

     print $fh_tgt $line;

  }
}

close($fh_src);
close($fh_tgt);

# 入力ファイル (拡張子 ".tmp" をつけたもの) を削除する
system("rm $src_path" . ".tmp");

if ($? == -1) {
  print "Error occured to renamed input file\n";
  exit(1);
}

#sub output_change_strings {
#  my $last = "";
#  if ($lines =~ /[\n]$/) {
#  } else {
#    $last = "\n";
#  }
#  print $fh_tgt "\n";
#  print $fh_tgt "\@x\n";
#  print $fh_tgt $lines . $last;
#  print $fh_tgt "\@y\n";
#  print $fh_tgt $lines . $last;
#  print $fh_tgt "\@z\n";
#}
