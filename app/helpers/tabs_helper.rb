module TabsHelper
  def create_tab(tab_name, tab_controller, tab_action)
    link_to_unless_current("#{tab_name}", {:controller => "#{tab_controller}", :action => "#{tab_action}"}) do
      output = '<span>'
      output << tab_name
      output << '</span>'
      output
    end
  end
end
