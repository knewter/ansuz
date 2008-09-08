module ApplicationHelper

  def current_database 
    ActiveRecord::Base.connection().current_database
  end
  
  def create_tab(tab_name, tab_controler, tab_action)
    link_to_unless_current("#{tab_name}", {:controller => "#{tab_controler}", :action => "#{tab_action}"}) do
      output = '<span>'
      output << tab_name
      output << '</span>'
      output
    end
  end

end