json.extract! contact_info, :id, :lat_map, :lon_map, :telepones, :emails, :facebook_link, :mercadolibre_link, :address_text, :created_at, :updated_at
json.url contact_info_url(contact_info, format: :json)
