#!/usr/bin/perl

use strict;
use warnings;

# Set the content type to HTML
print "Content-type: text/html\n\n";

# Store your message
my $message = "Hello, this is your dynamically inserted message from Perl!";

# Read the HTML template file
my $html_file = 'template.html';
my $html_content;

# Open the HTML file and read its content
if (open(my $fh, '<', $html_file)) {
    local $/;  # Enable 'slurp' mode to read the entire file into a scalar
    $html_content = <$fh>;
    close($fh);
} else {
    die "Could not open file '$html_file': $!";
}

# Replace the placeholder with the message
$html_content =~ s/<!-- MESSAGE_PLACEHOLDER -->/$message/;

# Print the resulting HTML
print $html_content;
