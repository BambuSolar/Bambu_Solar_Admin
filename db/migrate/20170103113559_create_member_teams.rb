class CreateMemberTeams < ActiveRecord::Migration
  def change
    create_table :member_teams do |t|
      t.string :name
      t.text :description
      t.references :picture, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
