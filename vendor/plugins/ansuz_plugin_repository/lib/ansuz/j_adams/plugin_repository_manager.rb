module Ansuz
  module JAdams
    class PluginRepositoryManager
      def self.write_file
        @ansuz_plugins = Ansuz::JAdams::AnsuzPlugin.find(:all, :order => 'name DESC')

        out = ""
        xml = Builder::XmlMarkup.new(:target => out, :indent => 2)
        xml.instruct!

        xml.plugins do
          @ansuz_plugins.each do |plugin|
            xml.plugin do
              xml.name plugin.name
              xml.repository_url plugin.repository_url
            end
          end
        end
        
        File.open("#{RAILS_ROOT}/public/ansuz_plugins.xml", "w") do |file|
          file << out
        end
      end
    end
  end
end
