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

  ci.telephones = '+54 9 261 512-4590,+54 9 261 592-3570'

  ci.emails = 'info@bambusolar.com,ventas@bambusolar.com'

  ci.facebook_link = 'https://www.facebook.com/bambuenergia'

  ci.mercadolibre_link = 'http://listado.mercadolibre.com.ar/_CustId_227447839'

  ci.address_text = 'Brazil 390 Esquina Rioja (CP 5500) - Ciudad - Mendoza - Argentina'

  ci.save!

end

if SocialNetwork.all.count() < 1

  SocialNetwork.find_or_create_by(
      name: 'Facebook',
      link: 'https://www.facebook.com/bambuenergia',
      icon: 'fa-facebook',
      order: 1
  )

  SocialNetwork.find_or_create_by(
      name: 'Instagram',
      link: 'https://www.instagram.com/bambusolar/',
      icon: 'fa-instagram',
      order: 2
  )

  SocialNetwork.find_or_create_by(
      name: 'YouTuBe',
      link: 'https://www.youtube.com/channel/UCc_2oYeuEMKZDk8pgi3auhQ',
      icon: 'fa-youtube',
      order: 3
  )

end


ci = ContactInfo.first

unless ci.nil?

  ci.link_to_map = 'https://www.google.com/maps/place/Bamb%C3%BA+Energ%C3%ADa+en+Movimiento/@-32.903855,-68.838907,17z/data=!4m5!3m4!1s0x0:0x2332fa78be053fbf!8m2!3d-32.9043815!4d-68.8389073?hl=es'

  ci.save!

end

hwc = HomeWebsiteConfig.first

unless hwc.nil?
  hwc.welcome_message = "Hola"

  hwc.save!
end

gi = GeneralInformation.all

if gi.size < 1

  gi = GeneralInformation.new

  gi.catalog = ''
  gi.demonstrative_video = ''

  gi.save!
end

