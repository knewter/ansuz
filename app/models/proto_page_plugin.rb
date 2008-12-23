# The proto page plugin exists for pageplugins that really
# don't warrant their own activerecord class (jskit, etc.)
#
class ProtoPagePlugin < ActiveRecord::Base
  validates_presence_of :name
end
