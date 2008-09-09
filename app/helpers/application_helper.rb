module ApplicationHelper

  def current_database 
    ActiveRecord::Base.connection().current_database
  end

end
