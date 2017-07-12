json.extract! social_network, :id, :name, :link, :icon, :order, :created_at, :updated_at
json.url social_network_url(social_network, format: :json)
