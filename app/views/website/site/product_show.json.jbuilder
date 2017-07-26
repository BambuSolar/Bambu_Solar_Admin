json.extract! @product, :id, :name, :description, :description_detail, :enabled, :product_type_id,
              :url_video_youtube, :classification, :sub_type_id, :to_quote
json.price number_to_currency(@product.price, unit: '$ ', separator: ',', delimiter: '.', :precision => 2)
json.picture @product.picture.photo_url
json.images ProductPicture.where(:product_id => @product.id).to_a do |i|
  json.url i.picture.photo.url
end