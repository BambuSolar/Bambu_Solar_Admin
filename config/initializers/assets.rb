# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( website_home.css )

Rails.application.config.assets.precompile += %w( website_product_type.css )

Rails.application.config.assets.precompile += %w( website_home.js )

Rails.application.config.assets.precompile += %w( website_product_type.js )

Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/