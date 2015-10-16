class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :doctor_id
      t.integer :customer_id
      t.string :pet
      t.boolean :reminder_required
      t.datetime :date_of_visit
      t.text :reason_for_visit
      t.timestamps null: false
    end
  end
end
