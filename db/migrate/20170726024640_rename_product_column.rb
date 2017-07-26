class RenameProductColumn < ActiveRecord::Migration
  def change

    rename_column :products, :category, :classification

    rename_column :product_types, :have_category, :have_classification

  end
end
