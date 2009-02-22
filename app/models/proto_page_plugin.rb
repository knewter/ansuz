# == Schema Information
# Schema version: 20090125222830
#
# Table name: proto_page_plugins
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# The proto page plugin exists for pageplugins that really
# don't warrant their own activerecord class (jskit, etc.)
#
class ProtoPagePlugin < ActiveRecord::Base
  validates_presence_of :name
end
