if User.all.size < 1

  u = User.new(
      :first_name => 'Admin',
      :last_name => 'Admin',
      :user_name => 'admin',
      :password => 'admin'
  )

  u.save!

end

ProductType.find_or_create_by(
    name: 'Termotanques Solares'
)

ProductType.find_or_create_by(
    name: 'Paneles Solares'
)

ProductType.find_or_create_by(
    name: 'Climatización de Picinas y Piletas'
)

if HomeWebsiteConfig.all.size < 1

  cwh = HomeWebsiteConfig.new

  cwh.save!

end

if ContactInfo.all.size < 1

  ci = ContactInfo.new

  ci.telepones = '+54 9 261 512-4590,+54 9 261 592-3570'

  ci.emails = 'info@bambusolar.com,ventas@bambusolar.com'

  ci.facebook_link = 'https://www.facebook.com/bambuenergia'

  ci.mercadolibre_link = 'http://listado.mercadolibre.com.ar/_CustId_227447839'

  ci.address_text = 'Brazil 390 - Ciudad - Mendoza - CP 5500'

  ci.iframe_map = '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d704.2016585351911!2d-68.83872710514328!3d-32.90434158799786!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x967e096b135750f5%3A0x557f5837841f441a!2sBrasil+390%2C+M5500GAC+Mendoza!5e0!3m2!1ses!2sar!4v1499996893278" width="800" height="600" frameborder="0" style="border:0" allowfullscreen></iframe>'

  ci.save!

end