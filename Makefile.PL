use inc::Module::Install;

name          ( 'Net-IP-Resolver'               );
abstract      ( 'Resolve IPs to a particular network' );
author        ( 'Adam Kennedy <cpan@ali.as>'    );
version_from  ( 'lib/Net/IP/Resolver.pm'        );
license       ( 'perl'                          );

requires      ( 'perl'               => '5.005' );
requires      ( 'Net::IP::Match::XS' => '0.03'  );

build_requires( 'Test::More'         => '0.47'  );
build_requires( 'File::Spec'         => '0.82'  );

auto_install();

&WriteAll;
