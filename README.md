Ibis tutorial/demo materials
===

TL;DR
===

Make sure you have VirtualBox, Anaconda, and Ibis installed. Run

    curl -s https://raw.githubusercontent.com/cloudera/ibis-notebooks/master/setup/bootstrap.sh | bash

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

Now, time to install Ibis.

    $ pip install ibis-framework

Or, if you have a git clone, run

    $ python setup.py install

Now, you're in business. Fire up the IPython notebook here by writing:

	$ ipython notebook

Start with the stuff in `basic-tutorial`. Assumes access to an Impala server
with the standard functional and TPC-H test datasets are available. You will
almost certainly need to change the connection details.
