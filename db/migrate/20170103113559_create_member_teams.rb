class CreateMemberTeams < ActiveRecord::Migration
  def change
    create_table :member_teams do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
