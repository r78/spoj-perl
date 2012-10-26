#!/usr/bin/env perl

$input = <>;
#read numbers from input and print them until input is 42
while ($input != 42) {
    print $input;
    $input = <>;
}
