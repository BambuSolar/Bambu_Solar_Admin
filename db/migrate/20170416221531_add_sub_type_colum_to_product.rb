class AddSubTypeColumToProduct < ActiveRecord::Migration
  def change

    add_column :products, :sub_type_id, :integer

  end
end
