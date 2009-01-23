require "yaml"
require File.join(File.dirname(__FILE__), "..","ansuz","installer.rb")
@installer = Ansuz::Installer.new

namespace :ansuz do
  desc "Set the CMS theme"
  task(:choose_theme => :environment) do
    @installer.choose_theme
  end

  # Called at the beginning of the initializer in config/environment.rb before Rails complains about not having a db"
  desc "Build a basic database.yml"
  task(:create_db_config) do
    @installer.create_db_config
  end

  desc "Run all the necessary tasks to install Ansuz"
  task(:install => :environment) do

    unless( File.exists?( File.join(RAILS_ROOT, "config", "database.yml") ) )
      STDOUT.puts "[ansuz]Please create a config/database.yml file before running this task."
      return false
    end
    
    STDOUT.puts "[ansuz] Creating database .."
    Kernel.silence_stream(STDOUT) do
      # FIXME
      # Invoking db tasks causes a rollback of some kind during testing -james
      #Rake::Task['db:create:all'].invoke 
      `rake db:create:all`
    end

    STDOUT.puts "[ansuz] Migrating tables .."
    Kernel.silence_stream(STDOUT) do
      #Rake::Task['db:migrate'].invoke
      `rake db:migrate`
    end

    STDOUT.puts "[ansuz] Migrating plugins .."
    Kernel.silence_stream(STDOUT) do
      #Rake::Task['db:migrate:plugins'].invoke
      `rake db:migrate:plugins`
    end

    if( User.find(:all, :conditions => ["login = 'admin'"]).empty? )
      STDOUT.puts "[ansuz] Enter a password for the default admin user:"
      STDOUT.flush
      password = $stdin.gets.chomp
      u = User.new :login => 'admin', :email => 'admin@example.com', :password => password, :password_confirmation => password
      u.save
      u.has_role 'admin'
      u.save # Not sure why we save twice. Josh?
      STDOUT.puts "[ansuz] Admin user created with login 'admin' and the password you entered."
    else
      STDOUT.puts "[ansuz] Admin user already exists."
    end

    # Create public/uploads directory for FCKeditor 
    unless( File.directory?( File.join(RAILS_ROOT, "public", "uploads") ) )
      STDOUT.puts "[ansuz] Creating public/uploads directory for FCKeditor.."
      FileUtils.mkdir( File.join(RAILS_ROOT, "public", "uploads") )
    end

    Rake::Task["ansuz:choose_theme"].invoke

    STDOUT.puts "[ansuz] Finished! Start Ansuz with `script/server` on Linux or `ruby script/server` on Windows."
  end

end
