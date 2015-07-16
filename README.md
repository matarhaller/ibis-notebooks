Ibis tutorial/demo materials
===

TL;DR
===

Make sure you have VirtualBox, Anaconda, and Ibis installed. Run

    curl -s http://github.com/cloudera/ibis-notebooks/raw/master/setup/bootstrap.sh | bash

to download the ibis-notebooks repositories and the pre-built VirtualBox image
to get you started.

First time user?
===

Here's instructions for bootstrapping an Ibis environment, replete with the
ability to use these IPython notebooks, from scratch.

First, download the Anaconda installer for your platform (this will even work
on Windows):

    http://continuum.io/downloads

Navigate to where this was downloaded and run something like

    $ bash Anaconda-2.1.0-Linux-x86_64.sh

Do not use sudo. Accept the license. I recommend using `$HOME/anaconda` as the
installation folder.

`$HOME/anaconda/bin` needs to be added to your system path. You can let the
installer do this for you or do it yourself. Start a new shell and verify
you're running Anaconda Python:

    $ ipython
    Python 2.7.9 |Anaconda 2.1.0 (64-bit)| (default, Dec 15 2014, 10:33:51)
    Type "copyright", "credits" or "license" for more information.

    IPython 2.2.0 -- An enhanced Interactive Python.
    Anaconda is brought to you by Continuum Analytics.
    Please check out: http://continuum.io/thanks and https://binstar.org
    ?         -> Introduction and overview of IPython's features.
    %quickref -> Quick reference.
    help      -> Python's own help system.
    object?   -> Details about 'object', use 'object??' for extra details.

    In [1]:

Now, time to install Ibis. Install directly from a supplied tarball

    $ tar xvf ibis-0.2.0.tar.gz
    $ cd ibis-0.2.0
    $ python setup.py install

Or, if you have a git clone, run

    $ python setup.py install

Verify your installation by running the test suite:

	$ python -c "import ibis; ibis.test()"
	================================== test session starts ==================================
	platform linux2 -- Python 2.7.9 -- py-1.4.25 -- pytest-2.6.3
	plugins: xdist
	collected 294 items

	../ibis/ibis/expr/tests/test_base.py ......................................................................................................................................
	../ibis/ibis/expr/tests/test_decimal.py ....
	../ibis/ibis/expr/tests/test_sql_builtins.py ....
	../ibis/ibis/expr/tests/test_string.py ....
	../ibis/ibis/expr/tests/test_timestamp.py ....
	../ibis/ibis/sql/tests/test_compiler.py ...................................................ss........................
	../ibis/ibis/sql/tests/test_exprs.py ..........................
	../ibis/ibis/tests/test_comms.py ssssssssssssssssssssss
	../ibis/ibis/tests/test_server.py ....
	../ibis/ibis/tests/test_tasks.py ssssssss

	========================= 7 tests deselected by "-m 'not e2e'" ==========================
	================= 255 passed, 32 skipped, 7 deselected in 1.70 seconds ==================

Now, you're in business. Fire up the IPython notebook here by writing:

	$ ipython notebook

Start with the stuff in `basic-tutorial`. Assumes access to an Impala
server with the standard functional and TPC-H test datasets are available.
