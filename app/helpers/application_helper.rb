module ApplicationHelper

  def current_database 
    begin
      ActiveRecord::Base.connection().current_database
    rescue
      # Sqlite/possibly other adapters may not implement the current_database method
      ActiveRecord::Base.configurations[RAILS_ENV]["database"]
    end
  end

end
