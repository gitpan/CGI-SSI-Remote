package CGI::SSI::Remote;

require Exporter;

use strict;
use vars qw($VERSION @EXPORT @ISA);

@ISA = qw(Exporter);
@EXPORT = qw(ssi);

$VERSION = '0.03';








sub ssi {
    my $args = {
        -get    => '',
        -host   => 'http://www.forum.uz',
        @_
    };

    eval 'require LWP::Simple';

    if ( $@ ) {
        return "[error occured while processing ssi: $@]";
    }
    return LWP::Simple::get($args->{'-host'} . '/' . $args->{'-get'}) || "[ ssi: empty content ]";
}




1;
__END__

=head1 NAME

CGI::SSI::Remote - Perl extension for fetching remote SSI scripts

=head1 SYNOPSIS

  use CGI::SSI::Remote;

  print ssi(-get=>'header.phtml', -host=>'http://foo.bar.com');

=head1 DESCRIPTION

Fetches files remotedly and inserts them as SSI. For doing it locally,
please refer to the documentation of L<CGI::SSI>

=head2 EXPORT

=over 4

=item *

C<ssi()>

returns the content.

=head1 AUTHOR

Sherzod B. Ruzmetov <sherzodr@cpan.org>

=head1 SEE ALSO

L<CGI::SSI>.

=cut
