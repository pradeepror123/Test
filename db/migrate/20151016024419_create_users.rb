class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :role_id
      t.string :username
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
