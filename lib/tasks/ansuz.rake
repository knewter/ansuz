require "yaml"

namespace :ansuz do
  desc "Set the CMS theme"
  task(:choose_theme => :environment) do
    themes =   Dir.entries( File.join(RAILS_ROOT, "public", "themes")).select{|d| d =~ /^\w|^\d/}.collect{|theme| theme="- #{theme}"}
    if( themes.any? )
      STDOUT.puts "[ansuz] Themes:\n" + themes.join("\n")
      STDOUT.puts "[ansuz] Enter a selection above, or leave blank for default"
      theme_choice = $stdin.gets.chomp
      unless( theme_choice.blank? )
        theme = theme_choice.detect{|t| t == theme_choice}
        if( theme )
          SiteSetting.find_or_create_by_name(:default).update_attribute(:user_theme_name, theme)
        else
          STDOUT.puts "[ansuz] invalid theme."
        end
      end
    else
      STDOUT.puts "[ansuz] No themes available!"
    end
  end

  # Called at the beginning of the initializer in config/environment.rb before Rails complains about not having a db"
  desc "Build a basic database.yml"
  task(:create_db_config) do
    unless( File.exists?( File.join(RAILS_ROOT, "config", "database.yml") ) )
      STDOUT.puts "[ansuz] Database config does not exist? Would you like one created for you? (Rails will not boot until it has a valid db config)"
      response = $stdin.gets.chomp
      if( response =~ /^y|^yes/i )
        config = { }
        STDOUT.puts "[ansuz] Database Wizard: Which adapter will the CMS use? ( mysql, sqlite, etc) "
        database_adapter = $stdin.gets.chomp.strip
        database_adapter = "mysql" if database_adapter.blank?
        config["adapter"] = database_adapter.downcase
        if( database_adapter != "sqlite" )
          STDOUT.puts "[ansuz] Host (localhost):"
          database_host = $stdin.gets.chomp.strip
          database_host = "localhost" if database_host.blank?
          config["host"] = database_host

          STDOUT.puts "[ansuz] Username (root):"
          database_username = $stdin.gets.chomp.strip
          database_username = "root" if database_username.blank?
          config["user"] = database_username

          STDOUT.puts "[ansuz] Password:"
          database_password = $stdin.gets.chomp.strip
          database_password = nil if database_password.blank?
          config["password"] = database_password

          STDOUT.puts "[ansuz] Socket (/var/run/mysqld/mysqld.sock): "
          database_socket = $stdin.gets.chomp.strip
          database_socket = "/var/run/mysqld/mysqld.sock" if database_socket.blank?
          config["socket"] = database_socket 

          STDOUT.puts "[ansuz] Database Name Prefix (ansuz):"
          database_prefix = $stdin.gets.chomp.strip
          database_prefix = "ansuz" if database_prefix.blank?
          config["database"] = database_prefix
        else
          STDOUT.puts "[ansuz] Database Location (db/development.sqlite):"
          database_location = $stdin.gets.chomp.strip
          database_location = "db" if database_location.blank?
          config["database"] = database_location 
        end

        database_config = {}
        ["production","development","test"].each do |env|
          database_config[env] = {}
          config.each_pair do |key,val|
            case key
            when "database":
              database_config[env][key] = val + "_" + env
            when "location":
              database_config[env][key] = val + "/#{env}.sqlite"
            else
              database_config[env][key] = val
            end
          end
        end

        database_yaml = YAML::dump( database_config ).gsub(/^---/,'')
        handle = File.open( File.join(RAILS_ROOT, "config", "database.yml"),"w" )
        handle.puts( database_yaml )
        handle.close
        STDOUT.puts "[ansuz] Database configuration created successfully"
      end
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
