module Ansuz
  class Installer
    attr_accessor :environment, :themes, :state

    def initialize(environment = ENV['RAILS_ENV'], stdin = $stdin, stdout = $stdout)
      @environment = environment
      @themes      = []
      @stdin       = stdin
      @stdout      = stdout
      @state       = :started
    end

    def choose_theme(theme_directory = File.join(RAILS_ROOT, "public", "themes")) 
      @themes =   Dir.entries(theme_directory).select{|d| d =~ /^\w|^\d/}.collect{|theme| theme="- #{theme}"}
      if( @themes.any? )
        @stdout.puts "[ansuz] Themes:\n" + @themes.join("\n")
        @stdout.puts "[ansuz] Enter a selection above, or leave blank for default"
        theme_choice = @stdin.gets.chomp
        unless( theme_choice.blank? )
          @stdout.puts "you chose #{theme_choice}"
          @themes.collect{|t| t.gsub!(/^\- /,'') }
          theme = @themes.detect{|t| t == theme_choice}
          if( theme )
            @state = :theme_installed
            return SiteSetting.find_or_create_by_name(:default).update_attribute(:user_theme_name, theme)
          else
            @state = :invalid_theme
            @stdout.puts "[ansuz] invalid theme."
          end
        end
      else
        @state = :no_themes_available
        @stdout.puts "[ansuz]No themes available!"
      end
    end

    def get_user_response_for(question, default_response="")
      @stdout.puts question
      response = @stdin.gets.chomp.strip
      if( response.nil? || response.blank? )
        return default_response
      else
        return response
      end
    end

    def create_db_config(database_yaml_path = File.join(RAILS_ROOT, "config", "database.yml") )
      unless( File.exists?( database_yaml_path ) )
        @stdout.puts "[ansuz] Database config does not exist? Would you like one created for you? (Rails will not boot until it has a valid db config)"
        @state = :user_wants_database_yaml
        response = @stdin.gets.chomp
        if( response =~ /^y|^yes/i )
          config = { }
          config["adapter"] = get_user_response_for("[ansuz] Database Wizard: Which adapter will the CMS use? ( mysql, sqlite, etc) ", "mysql").downcase
          if( config["adapter"] != "sqlite" )
            config["host"]     = get_user_response_for("[ansuz] Host (localhost):", "localhost").downcase
            config["user"]     = get_user_response_for("[ansuz] Username (root):", "root")
            config["password"] = get_user_response_for("[ansuz] Password:", nil)
            config["socket"]   = get_user_response_for("[ansuz] Socket (/var/run/mysqld/mysqld.sock): ", "/var/run/mysqld/mysqld.sock")
            config["database"] = get_user_response_for("[ansuz] Database Name Prefix (ansuz):", "ansuz")
          else
            config["database"] = get_user_response_for("[ansuz] Database Location (db/development.sqlite):", "db")
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
          @state = :database_yaml_created_successfully
          @stdout.puts "[ansuz] Database configuration created successfully"
        else
          @state = :user_doesnt_want_database_yaml
        end
      else
        @state = :database_yaml_exists
      end
    end

    def install
      unless( File.exists?( File.join(RAILS_ROOT, "config", "database.yml") ) )
        @stdout.puts "[ansuz]Please create a config/database.yml file before running this task."
        return false
      end
      
      @stdout.puts "[ansuz] Creating database .."
      Kernel.silence_stream(@stdout) do
        # FIXME
        # Invoking db tasks causes a rollback of some kind during testing -james
        #Rake::Task['db:create:all'].invoke 
        create_database
      end

      @stdout.puts "[ansuz] Migrating tables .."
      Kernel.silence_stream(@stdout) do
        migrate_database
      end

      @stdout.puts "[ansuz] Migrating plugins .."
      Kernel.silence_stream(@stdout) do
        migrate_plugins
      end

      if( User.find(:all, :conditions => ["login = 'admin'"]).empty? )
        @stdout.puts "[ansuz] Enter a password for the default admin user:"
        @stdout.flush
        password = @stdin.gets.chomp
        u = User.new :login => 'admin', :email => 'admin@example.com', :password => password, :password_confirmation => password
        u.save
        u.has_role 'admin'
        u.save # Not sure why we save twice. Josh?
        @stdout.puts "[ansuz] Admin user created with login 'admin' and the password you entered."
      else
        @stdout.puts "[ansuz] Admin user already exists."
      end

      # Create public/uploads directory for FCKeditor 
      unless( File.directory?( File.join(RAILS_ROOT, "public", "uploads") ) )
        @stdout.puts "[ansuz] Creating public/uploads directory for FCKeditor.."
        FileUtils.mkdir( File.join(RAILS_ROOT, "public", "uploads") )
      end

      self.choose_theme

      @stdout.puts "[ansuz] Finished! Start Ansuz with `script/server` on Linux or `ruby script/server` on Windows."
    end


  end

  protected
  def create_database
    system "rake db:create:all" 
  end

  def migrate_database
    system "rake db:migrate"
  end

  def migrate_plugins
    system "rake db:migrate:plugins"
  end

end
