xml.themes do
  @ansuz_themes.each do |theme|
    xml.theme do
      xml.name theme.name
      xml.repository_url theme.repository_url
    end
  end
end
