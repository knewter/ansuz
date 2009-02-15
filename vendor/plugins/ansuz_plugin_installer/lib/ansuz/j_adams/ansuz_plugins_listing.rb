require 'open-uri'
module Ansuz
  module JAdams
    class AnsuzPluginsListing
      #REPOSITORY = "http://ansuzcms.com/ansuz_plugins.xml"
      REPOSITORY = "http://localhost:3000/ansuz_plugins.xml"

      PLUGIN_HOLDING_DIR = 'ansuz_installed_plugins'

      # Returns an array of plugin arrays.  A plugin array 
      # looks like [name, repository_url]
      def self.listing
        ary = []
        xml.elements.each("plugins/plugin") do |plugin|
          name = plugin.elements["name"].text
          repository_url = plugin.elements["repository_url"].text
          ary << [name, repository_url, install_dir_for_repo(repository_url)]
        end
        ary
      end

      def self.xml_document
        uri = URI.parse REPOSITORY
        uri.read
      end

      def self.install_dir_for_repo repo
        repo.split("/").last.split(".").first
      end

      def self.xml
        REXML::Document.new xml_document
      end

      # This method will install a plugin, given a repository url
      def self.install repository_url, name
        `cd #{RAILS_ROOT}/#{PLUGIN_HOLDING_DIR}; git clone #{repository_url} #{name}`
      end

      # this method will copy a given plugin from PLUGIN_HOLDING_DIR to plugins
      def self.enable name
        FileUtils.cp_r(File.join(RAILS_ROOT, PLUGIN_HOLDING_DIR, name), File.join(RAILS_ROOT, 'vendor', 'plugins', name))
        restart_ansuz
      end

      # This method will disable a given plugin (i.e. rm from plugins dir)
      def self.disable name
        FileUtils.rm_r(File.join(RAILS_ROOT, 'vendor', 'plugins', name))
        restart_ansuz
      end

      def self.update name
        `cd #{plugin_folder_for(name)}; git pull`
      end

      def self.delete name
        FileUtil.rm_r plugin_folder_for(name)
        FileUtil.rm_r installed_plugin_folder_for(name)
      end

      def self.installed?(name)
        File.exist?(plugin_folder_for(name))
      end

      def self.enabled?(name)
        File.exist?(installed_plugin_folder_for(name))
      end

      def self.plugin_folder_for name
        File.join(RAILS_ROOT, PLUGIN_HOLDING_DIR, name)
      end

      def self.installed_plugin_folder_for name
        File.join(RAILS_ROOT, 'vendor', 'plugins', name)
      end

      def self.restart_ansuz
        FileUtils.touch(File.join(RAILS_ROOT, 'tmp', 'restart.txt'))
      end
    end
  end
end
