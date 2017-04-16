class AddSubTypeProduct < ActiveRecord::Migration
  def change

    add_column :product_types, :have_sub_type, :boolean, :default => FALSE

  end
end
