package Template::Plugin::Filter::String::Truncate;

# ABSTRACT: String::Truncate filter for Template::Toolkit

use 5.006;
use strict;
use base 'Template::Plugin::Filter';
use String::Truncate;

our $DYNAMIC = 1;

sub init {
    my $self = shift;

    $self->install_filter('elide');

    return $self;
}

sub filter {
    my ($self, $text, $args, $conf) = @_;

    my ($len) = @$args;

    $text = String::Truncate::elide($text, $len, $conf);

    return $text;
}

1;

__END__

=begin Pod::Coverage

filter
init

=end Pod::Coverage

=head1 SYNOPSIS

 [% USE Filter.String.Truncate %]

 # right side elide
 [% 'This is your brain' | elide(16) %]
 This is your ...

 # left side elide
 [% 'This is your brain' | elide(16, truncate => 'left') %]
 ...is your brain

 # middle elide
 [% 'This is your brain' | elide(16, truncate => 'middle') %]
 This is... brain

 # block syntax
 [% FILTER elide(16) -%]
 This is your brain
 [%- END %]
 THis is your ...

=head1 DESCRIPTION

This module is a Template Toolkit filter, which uses L<String::Truncate> to
truncate strings.

=head1 SEE ALSO

L<String::Truncate>

