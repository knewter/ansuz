# == Schema Information
# Schema version: 20090125222830
#
# Table name: page_metadatas
#
#  id          :integer(4)      not null, primary key
#  page_id     :integer(4)
#  title       :string(255)
#  subject     :string(255)
#  description :text
#  publisher   :string(255)
#  rights      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class PageMetadata < ActiveRecord::Base
end
