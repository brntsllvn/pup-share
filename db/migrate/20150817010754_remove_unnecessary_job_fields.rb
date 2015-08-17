class RemoveUnnecessaryJobFields < ActiveRecord::Migration
  def change
    remove_column :jobs, :owner_first_name
    remove_column :jobs, :owner_last_name
    remove_column :jobs, :owner_phone
    remove_column :jobs, :owner_emergency_phone
    remove_column :jobs, :owner_building_name
    remove_column :jobs, :walker_first_name
    remove_column :jobs, :walker_last_name
    remove_column :jobs, :walker_phone
    remove_column :jobs, :walker_emergency_phone
    remove_column :jobs, :walker_building_name
  end
end
