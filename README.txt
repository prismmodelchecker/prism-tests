Regressions tests
----------------

Each model file (*.?m) is a separate test (possibly comprising multiple parts).
Optionally there can be properties file(s), named <model>*.props.

Tests should be run as "prism -test <model> <props>"
(where the latter is omitted if absent)

If there is a file <model>.args, this denotes required additional command-line arguments.
Similarly, a file <props>.args can give further arguments for each property.

Alternatively, run "make clean" and then "make" to automated testing of all files.
If "prism" is not in your path, use "make PRISM_EXEC=/full/path/to/bin/prism".
The Makefile is also symlinked to subdirectories for partial testing.

Current test sets are:

* functionality/ : currently partial coverage of PRISM's functionality
* bugfixes/ : examples based on previously fixed bugs
* papers/ : tutorial/toy examples from papers
* pmc/ : examples from Probabilistic Model Checking lecture course
