class AddColumnsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :pet_name, :string
    add_column :appointments, :type_of_pet, :string
    add_column :appointments, :breed, :string
    add_column :appointments, :weight, :string
    add_column :appointments, :age, :string
    add_column :appointments, :date_of_last_visit, :datetime
  end
end
