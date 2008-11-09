    class Fyle < ActiveRecord::Base
        acts_as_taggable
        def self.get_mime_type(file)
            r=self.find_by_file_name(file);
            r.mime_type
        end
    end
