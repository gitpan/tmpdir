#
# tmpdir.pm, version 1.0 1 September 1999
#
# Copyright (c) 1999 SANFACE Software
# mailto:sanface@sanface.com
# http://www.sanface.com
# 
# Free usage under the same Perl Licence condition.
#

package tmpdir;

use strict;
use vars qw($VERSION);
$VERSION = "1.0";

sub new
  {
      my $tempdir;

# Windows 32 bit ('95, '98, NT)
      if ($^O =~ /^MSWin32$/i)      {$tempdir="c:/temp/"}
# or  if ($^O =~ /^MSWin32$/i)      {$tempdir="c:/windows/temp/"}

# Unix
      elsif ($^O =~ /^solaris$/i)   {$tempdir="/tmp/"}
      elsif ($^O =~ /^irix$/i)      {$tempdir="/tmp/"}
      elsif ($^O =~ /^aix$/i)       {$tempdir="/tmp/"}
      elsif ($^O =~ /^linux$/i)     {$tempdir="/tmp/"}
# ?      elsif ($^O =~ /^hp-ux$/i)     {$tempdir="/tmp/"}


# Mac
      elsif ($^O =~ /^MacOS$/i)     {$tempdir="/desktop folder/temp/"}

# OpenVMS [from Dave Smith mailto:smith@nwoca.org]
      elsif ($^O =~ /VMS/)          {$tempdir="/sys\$scratch/"}
# or  elsif ($^O =~ /VMS/)          {$tempdir="SYS\$SCRATCH"}

# default ./
      else {$tempdir="./"}

      return $tempdir;
  }

1;

__END__

=head1 NAME

tmpdir - Module to automathize the configuration of the temporary directory in
every OS supported by PERL

=head1 SYNOPSIS

  use tmpdir;

  $dir=tmpdir->new ;

  print "Correct temporary directory in the $^O OS is $dir\n";

=head1 DESCRIPTION

What's the problem?
Every PERL tool use temporary files.
If you want your code can be simply portable on different OS, you need to select
the correct tempory directory (the other solution is to use ./ directory).
The purpose of this module is to automathize the configuration of the temporary
directory in every OS supported by PERL.
We need your help. 
We ask you to send us the correct tempory directory for every OS supported by
PERL and to suggest us good modifies (<sanface@sanface.com>).

=head1 Constructor

=over 4

=item B<new>

This is the constructor and the only method of this library. It returns the
correct temporary directory if it checks correctly the OS, otherwise it returns
the default directory B<./>

=back

=head1 Copyright

  Copyright 1999, SANFACE Software

This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 Availability

The latest version of this library is likely to be available from:

http://www.sanface.com

and at any CPAN mirror ( http://www.perl.com/CPAN/authors/id/S/SA/SANFACE/ )

=cut

