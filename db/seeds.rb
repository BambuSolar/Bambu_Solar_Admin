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