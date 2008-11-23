module Ansuz
  module JAdams
    class ThemeRepositoryManager
      def self.write_file
        @ansuz_themes = Ansuz::JAdams::AnsuzTheme.find(:all, :order => 'name DESC')

        out = ""
        xml = Builder::XmlMarkup.new(:target => out, :indent => 2)
        xml.instruct!

        xml.themes do
          @ansuz_themes.each do |theme|
            xml.theme do
              xml.name theme.name
              xml.repository_url theme.repository_url
            end
          end
        end
        
        File.open("#{RAILS_ROOT}/public/ansuz_themes.xml", "w") do |file|
          file << out
        end
      end
    end
  end
end
