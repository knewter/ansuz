# Ansuz

- [Homepage](http://www.ansuzcms.com)
- [ansuz-cms Google Group](http://groups.google.com/group/ansuz-cms)
- [ansuz on github](http://www.github.com/knewter/ansuz)
- [track bugs on lighthouse](http://ansuz.lighthouseapp.com/projects/15780-ansuz/overview)
- On IRC at Freenode #ansuz
- [ansuz-commit-log Google Group](http://groups.google.com/group/ansuz-commit-log)
 
Ansuz is an open source Content Management System built in Ruby on Rails.
It aims for a modular / plugin-based design, and should have more features
out of the box than any other Rails CMS we’re aware of.
 
By combining the CMSes of Isshen Solutions and Isotope 11, we plan to create
a best-of-breed technology suitable for production use on a myriad of sites.
Ansuz is licensed via the BSD license.
 
## Quick Start
 
 1. clone from github: git clone git://github.com/knewter/ansuz.git
 2. rake ansuz:install - this will help create your database.yml, create the databases, run all migrations, then plugin migrations, and create an initial admin user
 
NOTE: SQLite has problems with ansuz, please don't use it for now.

NOTE: See the [Ansuz Site Launcher](http://github.com/knewter/ansuz_launcher/tree/master)
If run with sudo on a server with passenger set up and all the gems already installed, 
it will check out a new ansuz and set up a fresh database for it and set up a vhost 
for the domain specified. So, then if that domain points to the server, Bam! Done.
 
## This software is BSD licensed. See the COPYING file for details.
 
For help, feel free to contact the authors at [Our Google Gorup](http://groups.google.com/group/ansuz-cms), or individually:

- josh at isotope11.com
- james at isotope11.com
- adam at isshen.com

## Physical Address
Isotope 11, Inc.
529 Beacon Parkway
Suite 105
Birmingham, AL 35209
