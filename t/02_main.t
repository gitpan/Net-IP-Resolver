#!/usr/bin/perl -w

# Main tests for the Net::IP::Resolver module

use strict;
use lib ();
use UNIVERSAL 'isa';
use File::Spec::Functions ':ALL';
BEGIN {
	$| = 1;
	unless ( $ENV{HARNESS_ACTIVE} ) {
		require FindBin;
		chdir ($FindBin::Bin = $FindBin::Bin); # Avoid a warning
		lib->import( catdir( updir(), updir(), 'modules') );
	}
}

use Test::More tests => 9;
use Net::IP::Resolver ();





#####################################################################
# Just the basics for now

my $Resolver = Net::IP::Resolver->new;
isa_ok( $Resolver, 'Net::IP::Resolver' );
is( $Resolver->add( 'Comcast', '123.123.0.0/16', '1.2.3.0/24' ), 1,
	'Added basic named network' );
my $company = bless {}, 'Foo';
isa_ok( $company, 'Foo' );
is( $Resolver->add( $company, '124.124.124.0/24' ), 1,
	'Added object network' );
is( $Resolver->find_first(), undef, '->find_fist() returns undef' );
is( $Resolver->find_first( '123.123.123.123' ), 'Comcast',
	'->find_first(ip) returned correct named network' );
is( $Resolver->find_first( '1.2.3.4' ), 'Comcast',
	'->find_first(ip) returned correct named network' );
isa_ok( $Resolver->find_first( '124.124.124.124' ), 'Foo' );
is( $Resolver->find_first( '2.3.4.5' ), undef, '->find_first(outside) ip returns undef' );

1;
