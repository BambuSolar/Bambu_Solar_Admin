class AgregateProductCategory < ActiveRecord::Migration
  def change

    add_column :products, :category, :string, :default => 'product'

    add_column :product_types, :have_category, :boolean, :default => FALSE

  end
end
