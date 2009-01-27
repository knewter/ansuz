require File.dirname(__FILE__) + '/spec_helper'
require "stringio"

# TODO CHECK FOR NO THEMES!
describe Ansuz::Installer do
  describe "choosing a theme" do
    before(:each) do
      @stdin     = StringIO.new("","r+") # Fake STDIN/STDOUT
      @stdout    = StringIO.new("","r+")
      @installer = Ansuz::Installer.new('test', @stdin, @stdout)
      @theme_dir = File.join(File.dirname(__FILE__), "test_themes")
      FileUtils.mkdir_p( @theme_dir )
      FileUtils.touch File.join(@theme_dir, "a_test_theme")
    end

    it "should show a list of themes available" do
      @stdin.write "a_test_theme\n" # We gotta write and rewind, or the method won't see anything
      @stdin.rewind

      @installer.choose_theme( @theme_dir )

      @installer.themes.should == ['a_test_theme']

    end

    it "should set the default theme according to user input" do
      @stdin.write "a_test_theme\n"
      @stdin.rewind
      @installer.choose_theme( @theme_dir )
      
      SiteSetting.find_or_create_by_name(:default).user_theme_name.should == 'a_test_theme'
    end

    it "should NOT set the default theme according to user input if user typos a theme name" do
      @stdin.write "a_invalid_test_theme\n"
      @stdin.rewind
      @installer.choose_theme( @theme_dir )

      SiteSetting.find_or_create_by_name(:default).user_theme_name.should == nil
    end

    after(:each) do 
      FileUtils.rm_r(@theme_dir)
    end
  end

  describe "creating a database.yml" do
    before(:each) do
      @stdin     = StringIO.new("","r+") # Fake STDIN
      @stdout    = StringIO.new("","r+")
      @installer = Ansuz::Installer.new('test', @stdin, @stdout )
      @database_yaml_path        = File.join(RAILS_ROOT, "config", "database.yml") 
      @database_yaml_backup_path = File.join(RAILS_ROOT, "config", "database.yml.bak") 
       
      # Don't destroy the database config!!
      if( !File.exists?( @database_yaml_backup_path ) &&  File.exists?( @database_yaml_path ) )
        FileUtils.cp( @database_yaml_path ,  @database_yaml_backup_path )
      end
      
      if( File.exists?( @database_yaml_path ) )
        FileUtils.rm( @database_yaml_path )
      end
    end

    it "should not continue if the user enters a newline or anything other than y/yes" do
    #  @stdin.write "banjo\n"
    #  @stdin.rewind
    #  @installer.create_db_config
    #  @installer.state.should == :user_doesnt_want_database_yaml
    end

    it "should prompt the user if he/she wants a database.yml created for them" do
      @stdin.write "y\n"
      @installer.create_db_config "pooptown"
      @stdin.write "sqlite"
      #@stdin.write "localhost"
      #@stdin.write "root"
      #@stdin.write ""
      #@stdin.write "database"
      @installer.state.should == :database_yaml_created_successfully
    end

    it "should run all the necessary rake tasks to get ansuz running" do
      @installer.install
      File.exists?( File.join(RAILS_ROOT, "db", "schema.rb" )).should == true
    end
    
    after(:each) do 
      @stdout.truncate(0)
      @stdin.close_write
      @stdin.reopen("","r+")
      if( File.exists?( @database_yaml_backup_path ) && !File.exists?( @database_yaml_path ) )
        FileUtils.cp( @database_yaml_backup_path , @database_yaml_path )
      end
    end
  end
end

