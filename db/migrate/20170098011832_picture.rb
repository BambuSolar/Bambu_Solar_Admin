class Picture < ActiveRecord::Migration

  def change
    create_table :pictures do |t|
      t.string :photo
      t.timestamps null: false
    end
  end

end
