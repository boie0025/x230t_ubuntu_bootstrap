#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

######################################################
# Author: lipp0050
# Email: baz@foo.bar
#
# Created: 10/23/13
# Last modified: 10/23/13
#
# Description:
#
# This is a program for creating a loose
# perl based template
######################################################


if (!defined $ARGV[0]) { # Was a filename defined at the start of the program?
    die "Please enter a filename when you execute the program.\n"
}

my ($input) = ($ARGV[0] =~ m/(^[^\W]*)/); # Strip ARGV[0] of any
                                          # characters, after the first
                                          # nonword character

my $new_filename = $input . '.pl'; # Append '.pl' to the new filename

if (-e $new_filename) { # Do not overwrite an existing file with the same name
        die "Filename already exists.\n"
}

open FILE_FH, '>', $new_filename;

# Set up the programs environment
print FILE_FH "#!/usr/bin/env perl\n\n",
              "use strict;\n",
              "use warnings;\n",
              "use autodie;\n\n";

# Set up programmer's details
print FILE_FH "#" x 54, "\n",
              "# Author: YOUR NAME\n", # Enter your name here
              "# Email: YourName\@foo.bar\n", # Enter your email here
              "#\n",
              "# Created:\n",
              "# Last modified:\n",
              "#\n",
              "# Description:\n",
              "#\n",
              "#\n",
              "#" x 54, "\n";

close FILE_FH;

chmod 0755, "$new_filename"; # Make the program executable

system ("vim $new_filename");
