class AddFieldsToValidateAWalk < ActiveRecord::Migration
  def change
    add_column :jobs, :owner_first_name, :string
    add_column :jobs, :owner_last_name, :string
    add_column :jobs, :owner_phone, :string
    add_column :jobs, :owner_emergency_phone, :string
    add_column :jobs, :owner_building_name, :string
    
    rename_column :jobs, :actual_walker_id, :walker_id
    add_column :jobs, :walker_first_name, :string
    add_column :jobs, :walker_last_name, :string
    add_column :jobs, :walker_phone, :string
    add_column :jobs, :walker_emergency_phone, :string
    add_column :jobs, :walker_building_name, :string
  end
end
