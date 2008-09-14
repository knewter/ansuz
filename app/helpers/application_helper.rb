module ApplicationHelper

  def current_database 
    begin
      ActiveRecord::Base.connection().current_database
    rescue
      # Sqlite/possibly other adapters may not implement the current_database method
      ActiveRecord::Base.configurations[RAILS_ENV]["database"]
    end
  end

  # title will output an h1 as well as update the title of the page
  def title string
    @title = string
    "<h1>#{string}</h1>"
  end

  # title_for is the helper intended to be used to output the text
  # in the title tag of the layout.
  def title_for string
    if @title
      "#{@title} | #{string}"
    else
      string
    end
  end
end
