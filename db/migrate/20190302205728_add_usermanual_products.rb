class AddUsermanualProducts < ActiveRecord::Migration
  def change
    add_column :products, :installation_manual, :string
  end
end
