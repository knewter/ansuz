namespace :ansuz do
  desc "Run all the necessary tasks to install Ansuz"
  task(:install => :environment) do

    unless( File.exists?( File.join(RAILS_ROOT, "config", "database.yml") ) )
      STDOUT.puts "Please create a config/database.yml file before running this task."
      return false
    end
    
    STDOUT.puts "Creating database .."
    Kernel.silence_stream(STDOUT) do
      # FIXME
      # Invoking db tasks causes a rollback of some kind during testing -james
      #Rake::Task['db:create:all'].invoke 
      `rake db:create:all`
    end

    STDOUT.puts "Migrating tables .."
    Kernel.silence_stream(STDOUT) do
      #Rake::Task['db:migrate'].invoke
      `rake db:migrate`
    end

    STDOUT.puts "Migrating plugins .."
    Kernel.silence_stream(STDOUT) do
      #Rake::Task['db:migrate:plugins'].invoke
      `rake db:migrate:plugins`
    end

    if( User.find(:all, :conditions => ["login = 'admin'"]).empty? )
      STDOUT.puts "Enter a password for the default admin user:"
      STDOUT.flush
      password = STDIN.gets.chomp
      u = User.new :login => 'admin', :email => 'admin@example.com', :password => password, :password_confirmation => password
      u.save
      u.has_role 'admin'
      u.save # Not sure why we save twice. Josh?
      STDOUT.puts "Admin user created with login 'admin' and the password you entered."
    else
      STDOUT.puts "Admin user already exists."
    end

    # Create public/uploads directory for FCKeditor 
    unless( File.directory?( File.join(RAILS_ROOT, "public", "uploads") ) )
      STDOUT.puts "Creating public/uploads directory for FCKeditor.."
      FileUtils.mkdir( File.join(RAILS_ROOT, "public", "uploads") )
    end

    STDOUT.puts "Finished! Start Ansuz with `script/server` on Linux or `ruby script/server` on Windows."
  end

end
