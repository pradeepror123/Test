class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :school
      t.integer :years_in_practice
      t.timestamps null: false
    end
  end
end
