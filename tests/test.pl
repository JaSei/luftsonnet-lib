#!/usr/bin/env perl 
use strict;
use warnings;

use YAML::XS qw(LoadFile);
use Cpanel::JSON::XS qw(decode_json); 
use Path::Tiny;
use Test::More;

my $tests = 0;
path($ARGV[0])->visit(
    sub {
        my ($path) = @_;

        if ($path =~ /(.+)\.yaml$/) {
            my $name = $1;

            $tests++;

            my $jsonnet = decode_json(path("$name.jsonnet.json")->slurp());
            my @yaml = LoadFile($path);

            is_deeply(
                {
                    kind       => 'List',
                    apiVersion => 'v1',
                    items      => \@yaml,
                },
                $jsonnet,
                $path
            );
        }
        else {
            return
        }
    },
    {
        recurse => 1
    }
);

done_testing($tests);
