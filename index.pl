#!/usr/bin/env perl
use Dancer2;
use Plack::Runner;

## For some reason Apache SetEnv directives dont propagate
## correctly to the dispatchers, so forcing PSGI and env here 
## is safer.'production'o 'development'
set apphandler => 'PSGI';
set environment => 'development';

my $psgi;
$psgi = path($ENV{'DOCUMENT_ROOT'}, 'app.psgi');
die "Unable to read startup script: $psgi" unless -r $psgi;

Plack::Runner->run($psgi);
