class AddColumnToQuoteProduct < ActiveRecord::Migration
  def change

    add_column :products, :to_quote, :boolean, :default => false

  end
end
