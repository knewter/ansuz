module TabsHelper
  def create_tab(tab_name, url)
    link_to_unless_current(tab_name, url) do
      output = '<span>'
      output << tab_name
      output << '</span>'
      output
    end
  end
end
