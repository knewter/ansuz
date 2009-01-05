# Ansuz
 
Ansuz is an open source Content Management System built in Ruby on Rails.
It aims for a modular / plugin-based design, and should have more features
out of the box than any other Rails CMS we’re aware of.
 
By combining the CMSes of Isshen Solutions and Isotope 11, we plan to create
a best-of-breed technology suitable for production use on a myriad of sites.
Ansuz is licensed via the BSD license.
 
# Gem Dependencies
    mislav-will_paginate
 
# Quick Start
 
 1. clone from github: git clone git://github.com/knewter/ansuz.git
 2. create database config in config/database.yml (see config/database.yml.example if you need help)
 3. run: gem sources -a http://gems.github.com
 4. install gems: rake gems:install
 5. run: gem install haml --no-ri --no-rdoc
 6. run plugin migrations: rake db:migrate:plugins
 7. create databases: rake db:create:all
 8. run migrations: rake db:migrate
 9. run tests: rake spec
10. create a new user (do not use this in production): rake utils:create_admin
11. create the folder at public/uploads (This is for fckeditor's resource browser / uploader)
12. start server: script/server -p 3000
13. goto: http://localhost:3000/admin
14. login with admin/admin
 
NOTE: SQLite has problems with ansuz, please don't use it for now.

NOTE: See the Ansuz Site Laucher
If run with sudo on a server with passenger set up and all the gems already installed, 
it will check out a new ansuz and set up a fresh database for it and set up a vhost 
for the domain specified. So, then if that domain points to the server, Bam! Done.
 
 
# This software is BSD licensed. See the COPYING file for details.
 
For help, feel free to contact the authors at:

- josh at isotope11.com
- james at isotope11.com
- adam at isshen.com

= Physical Address
Isotope 11, Inc.
600 Beacon Parkway
Suite 950
Birmingham, AL 35209
