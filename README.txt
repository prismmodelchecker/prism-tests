Regressions tests
----------------

Each test takes the form of a PRISM model file (e.g. test.nm),
usually with an accompanying property file given a matching name (e.g. test.nm.props).
Command-line switches that need to be passed to PRISM to run the test
can be included in a separate .args file, again with matching name (e.g. test.nm.props.args).

The tests are executed by running PRISM in test mode 'prism -test'.
This looks for a comment of the form '// RESULT: xxx' preceding each property
and then checks agains the expected result (xxx) after model checking.

Use the prism-test script (in etc/scripts/) to automate test execution.
(In fact, this works via the prism-auto script, also in etc/scripts.)
You can give prism-test either a specific property file (test.nm.props)
or a model file (test.nm), which runs all tests for that model.
Alternatively, pass prism-test a directory, which is searched recursively for tests.

Current test sets are:

* functionality/ : currently partial coverage of PRISM's functionality
* bugfixes/ : examples based on previously fixed bugs
* papers/ : tutorial/toy examples from papers
* pmc/ : examples from Probabilistic Model Checking lecture course
