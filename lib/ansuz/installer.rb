module Ansuz
  class Installer
    attr_accessor :environment, :themes, :state

    def initialize(environment = ENV['RAILS_ENV'], stdin = $stdin, stdout = $stdout)
      @environment = environment
      @themes      = []
      @stdin       = stdin
      @stdout      = stdout
      @state       = :started # this helps with the tests
    end

    def choose_theme(theme_directory = File.join(RAILS_ROOT, "public", "themes")) 
      FileUtils.mkdir_p( theme_directory ) unless File.directory?( theme_directory )
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
            begin
              return SiteSetting.find_or_create_by_name(:default).update_attribute(:user_theme_name, theme)
            rescue
              STDERR.puts "Badness happened trying to set the default theme. SQLite does this a lot."
            end
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
      @state = :getting_user_response
      @stdout.puts question
      @stdin = rewind(@stdin)
      response = @stdin.gets.chomp.strip
      @state = :got_user_response
      if( response.nil? || response.blank? )
        return default_response
      else
        return response
      end
    end

    def create_db_config(database_yaml_path = File.join(RAILS_ROOT, "config", "database.yml") )
      unless( File.exists?( database_yaml_path ) )
        response = get_user_response_for("[ansuz] Database config does not exist? Would you like one created for you? (Rails will not boot until it has a valid db config)")
        if( response =~ /^y|^yes/i )
          @state = :user_wants_database_yaml
          config = { }
          config["adapter"] = get_user_response_for("[ansuz] Database Wizard: Which adapter will the CMS use? ( mysql, sqlite, etc) ", "mysql").downcase
          if( config["adapter"] != "sqlite" )
            config["host"]     = get_user_response_for("[ansuz] Host (localhost):", "localhost").downcase
            config["user"]     = get_user_response_for("[ansuz] Username (root):", "root")
            config["password"] = get_user_response_for("[ansuz] Password:", nil)
            config["socket"]   = get_user_response_for("[ansuz] Socket (/var/run/mysqld/mysqld.sock): ", "/var/run/mysqld/mysqld.sock")
            config["database"] = get_user_response_for("[ansuz] Database Name Prefix (ansuz):", "ansuz")
          else
            config["database"] = get_user_response_for("[ansuz] Database Location (db/development.sqlite):", "db/")
          end

          create_config_for_environment(["production","development","test"], config)
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
        #@stdout.puts "[ansuz]Please create a config/database.yml file before running this task."
        #return false
        create_db_config
      end
      
      @stdout.puts "[ansuz] Creating database .."
      Kernel.silence_stream(@stdout) do
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

      # Create public/uploads directory for FCKeditor 
      create_fckeditor_uploads_dir

      choose_theme
      @state = :installation_complete



      @stdout.puts "[ansuz] Finished! Start Ansuz with `script/server` on Linux or `ruby script/server` on Windows."
    end

    protected

    def create_config_for_environment( environments, config )
      @state = :creating_config
      database_config = {}
      environments.each do |environment|
        database_config[environment] = {}
        config.each_pair do |key,val|
          case key
          when "database":
            database_config[environment][key] = val + "_" + environment
          when "location":
            database_config[environment][key] = val + "/#{environment}.sqlite"
          else
            database_config[environment][key] = val
          end
        end
      end

      database_yaml = YAML::dump( database_config ).gsub(/^---/,'')
      handle = File.open( File.join(RAILS_ROOT, "config", "database.yml"),"w" )
      handle.puts( database_yaml )
      handle.close
    end

    def create_default_admin_user(password)
      u = User.new :login => 'admin', :email => 'admin@example.com', :password => password, :password_confirmation => password
      u.save
      u.has_role 'admin'
      u.save
      @stdout.puts "[ansuz] Admin user created with login 'admin' and the password you entered."
    end

    def create_fckeditor_uploads_dir
      @state = :creating_fckeditor_uploads_dir
      unless( File.directory?( File.join(RAILS_ROOT, "public", "uploads") ) )
        @stdout.puts "[ansuz] Creating public/uploads directory for FCKeditor.."
        FileUtils.mkdir_p( File.join(RAILS_ROOT, "public", "uploads") )
        @state = :created_fckeditor_uploads_dir
      else
        @state = :fckeditor_uploads_dir_already_exists
      end
    end

    def create_database
      @state = :creating_databases
      system "rake db:create:all" 
    end

    def migrate_database
      @state = :migrating_database
      system "rake db:migrate"
    end

    def migrate_plugins
      @state = :migrating_plugins
      system "rake db:migrate:plugins"
    end

    def rewind(io)
      if( io.is_a?(StringIO) ) # In non-test environment, we can't seek through STDIN, it gets rewound for us I suppose -james
        io.rewind
      end
      io
    end
  end
end
