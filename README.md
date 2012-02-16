Title: README for mmdtops

# About

`mmdtops` is a wrapper program to facilitate converting MultiMarkdown to
PostScript or PDF.  The program allows the user to store LaTeX setup
information in configuration files rather than including it as metadata
in each document file.

`multimarkdown` allows for markdown texts to be formatted with LaTeX
using metadata directives embedded at the top of the document.  However,
these directives are quite repetitive to type in each file.  `mmdtops`
enables the user to define the LaTeX commands for different document
classes in configuration files and then choose the document class upon
conversion to PostScript.

# Installation

In order to install `mmdtops` your system need to meet the following
requirements:

- PERL

    - File::Temp

    - Pod::Usage

    - Getopt::Long

    - Config::IniFiles

- [peg-multimarkdown][pmmd]

- [peg-multimarkdown-latex-support][pmmdls]

- LaTeX

`mmdtops` can be installed by running `make install` from the command line
with root privileges.  The default is to install the program in
`/usr/local/bin`.  You should modify the Makefile if this is not what
you desire.

# Configuration

Configuration of the program is accomplished by `/etc/mmdtops.ini` and
local user configuration files in `~/.config/mmdtops.ini`.  See the
`/etc/mmdtops.ini` for details on configuration values.

# Security Issues

The program creates temporary files while processing in the directory
given in the `$TMPDIR` environment variable.  If `$TMPDIR` is undefined
the temporary directory defaults to `/tmp`.  If the program were to fail
for some reason, it is possible that copies of your files would remain
in the temporary directory.

# See Also

github repositories for:

- [peg-multimarkdown][pmmd]

- [peg-multimarkdown-latex-support][pmmdls]

[pmmd]: https://github.com/fletcher/peg-multimarkdown

[pmmdls]: https://github.com/fletcher/peg-multimarkdown-latex-support

