
use strict;
use warnings;

 BEGIN { require 5.006; } 

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Template::Plugin::Filter::String::Truncate',
                       'DISTNAME' => 'Template-Plugin-Filter-String-Truncate',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Michael Schout <mschout@cpan.org>',
                       'BUILD_REQUIRES' => {
                                             'Module::Signature' => '0',
                                             'Test::More' => '0',
                                             'Template::Test' => '0',
                                             'Socket' => '0'
                                           },
                       'ABSTRACT' => 'String::Truncate filter for Template::Toolkit',
                       'EXE_FILES' => [],
                       'VERSION' => '0.03',
                       'PREREQ_PM' => {
                                        'String::Truncate' => '0',
                                        'Template::Plugin::Filter' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM}; 
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod}; 
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



