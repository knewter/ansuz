default_run_options[:pty] = true

# SCM setup
set :scm,         :git
set :scm_verbose, false

set :user,   'deploy'
set :runner, 'deploy'
set :application, "ansuz" 
set :repository, "git@github.com:knewter/ansuz.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/deploy/#{application}"

role :app, "209.20.72.204"
role :web, "209.20.72.204"
role :db,  "209.20.72.204", :primary => true

task :sym_database_yml do
  run "ln -s #{current_release}/config/database.yml.production #{current_release}/config/database.yml"
end
task :sym_files do
  run "ln -s #{deploy_to}/shared/attached_files #{current_release}/public/attached_files"
  run "ln -s #{deploy_to}/shared/photo_album_photo_images #{current_release}/public/photo_album_photo_images"
  run "ln -s #{deploy_to}/shared/themes #{current_release}/themes"
end
task :run_plugin_migrations do
  run "cd #{current_release}; export RAILS_ENV=production; rake db:migrate:plugins"
end

after "deploy:finalize_update" do
  sym_database_yml
  sym_files
  run_plugin_migrations
end

namespace :host do
  desc "Update apt-get sources"
  task :update_apt_get do
    sudo "apt-get update"
  end

  desc "Install development tools"
  task :install_dev_tools do
    sudo "apt-get install build-essential -y"
  end

  desc "Install subversion"
  task :install_subversion do
    sudo "apt-get install subversion -y"
  end

  desc "Install MySQL"
  task :install_mysql do
    sudo "apt-get install mysql-server -y"
  end

  desc "Install Ruby, Gems, and Rails"
  task :install_rails_stack do
    [
       "sudo apt-get install ruby ruby1.8-dev irb ri rdoc libopenssl-ruby1.8 -y",  
       "mkdir -p src",  
       "cd src",  
       "wget http://rubyforge.org/frs/download.php/29548/rubygems-1.0.1.tgz",  
       "tar xvzf rubygems-1.0.1.tgz",  
       "cd rubygems-1.0.1/ && sudo ruby setup.rb",  
       "sudo ln -s /usr/bin/gem1.8 /usr/bin/gem",  
       "sudo gem install rails --no-ri --no-rdoc"  
    ].each{|cmd| run cmd}
  end

  desc "Install Apache"
  task :install_apache do
    sudo "apt-get install apache2 apache2.2-common apache2-mpm-prefork apache2-utils libexpat1 apache2-prefork-dev libapr1-dev -y"
  end

  desc "Install Passenger"
  task :install_passenger do
    run "sudo gem install passenger --no-ri --no-rdoc"
    input = ""
    run "sudo passenger-install-apache2-module" do |ch,stream,out|  
      next if out.chomp == input.chomp || out.chomp == ''  
      print out  
      ch.send_data(input = $stdin.gets) if out =~ /enter/i  
    end   
  end

  desc "Configure Passenger"
  task :config_passenger do
    run "mkdir -p src"
    passenger_config =<<-EOF
LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-2.0.2/ext/apache2/mod_passenger.so
RailsSpawnServer /usr/lib/ruby/gems/1.8/gems/passenger-2.0.2/bin/passenger-spawn-server
RailsRuby /usr/bin/ruby1.8    
    EOF
    put passenger_config, "src/passenger"
    sudo "mv src/passenger /etc/apache2/conf.d/passenger"
  end

  desc "Configure VHost"
  task :config_vhost do
    vhost_config =<<-EOF
<VirtualHost *:80>
ServerName  ansuzcms.com
ServerAlias  www.ansuzcms.com
DocumentRoot #{deploy_to}/current/public
  <Directory "#{deploy_to}/current/public">
    Options FollowSymLinks
    AllowOverride None
    Order allow,deny
    Allow from all
  </Directory>
  RailsBaseURI /
</VirtualHost>
    EOF
    put vhost_config, "src/vhost_config"
    sudo "mv src/vhost_config /etc/apache2/sites-available/#{application}"
    sudo "a2ensite #{application}"
  end

  desc "Restart Apache"
  task :restart_apache do
    sudo "/etc/init.d/apache2 reload"
  end

  desc "Just svn up current"
  task :svn_up_current do
    run "cd #{deploy_to}/current; svn up"
  end
end

namespace :cms do
  desc "Install required gems"
  task :install_required_gems do
    gems = %w(
      ferret
      shipping
      rubyzip
      BlueCloth
      fastercsv
    ).join(" ")
    run "sudo gem install #{gems}"
  end

  desc "Install rmagick"
  task :install_rmagick do
    sudo "apt-get install libmagick9-dev ruby1.8-dev -y"
    sudo "gem install rmagick"
  end

  desc "Install ruby-guid"
  task :install_ruby_guid do
     [
       "cd src",  
       "wget http://rubyforge.org/download.php/378/ruby-guid-0.0.1.tar.gz",  
       "tar xvzf ruby-guid-0.0.1.tar.gz",  
       "cd ruby-guid-0.0.1/ && ruby install.rb config && ruby install.rb setup && sudo ruby install.rb install"
     ].each{|cmd| run cmd }
  end
end
