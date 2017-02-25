json.data @product_types do |p_t|

  json.id p_t.id
  json.name p_t.name
  json.filename "/productos/#{I18n.transliterate(p_t.name.split(' ')[0].to_s.downcase)}/index.html"
  json.crawler_url preview_product_type_path(p_t)

end