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
  task(:install) do
    @installer.create_db_config
    @installer.install
    system("rake utils:create_admin")
    STDOUT.puts "[ansuz] Finished! Start Ansuz with `script/server` on Linux or `ruby script/server` on Windows."
  end

end
