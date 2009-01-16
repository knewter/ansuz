namespace :ansuz do
  desc "Set the CMS theme"
  task(:choose_theme => :environment) do
    themes =   Dir.entries( File.join(RAILS_ROOT, "public", "themes")).select{|d| d =~ /^\w|^\d/}.collect{|theme| theme="- #{theme}"}
    if( themes.any? )
      STDOUT.puts "[ansuz] Themes:\n" + themes.join("\n")
      STDOUT.puts "[ansuz] Enter a selection above, or leave blank for default"
      theme_choice = STDIN.gets.chomp
      unless( theme_choice.blank? )
        theme = theme_choice.detect{|t| t == theme_choice}
        if( theme )
          SiteSetting.find_or_create_by_name(:default).update_attribute(:user_theme_name, theme)
        else
          STDOUT.puts "[ansuz] nvalid theme."
        end
      end
    else
      STDOUT.puts "[ansuz]No themes available!"
    end
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
      password = STDIN.gets.chomp
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
