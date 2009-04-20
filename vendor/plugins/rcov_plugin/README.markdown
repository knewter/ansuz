rcov_plugin
===========

This is a simple rails plugin that adds some useful rcov tasks.

    rake test:coverage                # Tests coverage on the entire application
    rake test:coverage:units          # Tests coverage for unit tests
    rake test:coverage:functionals    # Tests coverage for functional tests
    rake test:coverage:integration    # Tests coverage for integration tests

The task ends up creating a coverage folder with an html coverage report in it.

SHOW_ONLY is a comma-separated list of the files you'd like to see (although
you can only run functionals, you still see all the models and helpers which 
are 'touched'). Right now there are four types of files rake test:coverage 
recognizes: models, helpers, controllers, and lib. These can be abbreviated 
to their first letters:

    rake test:coverage SHOW_ONLY=models
    rake test:coverage SHOW_ONLY=helpers,controllers
    rake test:coverage SHOW_ONLY=h,c

Requirements
============

This task requires that you have rcov installed and on your path.

License
=======
Copyright (c) 2008 Alan Johnson

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

