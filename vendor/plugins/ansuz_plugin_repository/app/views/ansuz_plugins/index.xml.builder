xml.plugins do
  @ansuz_plugins.each do |plugin|
    xml.plugin do
      xml.name plugin.name
      xml.repository_url plugin.repository_url
    end
  end
end
