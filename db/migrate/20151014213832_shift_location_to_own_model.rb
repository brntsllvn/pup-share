class ShiftLocationToOwnModel < ActiveRecord::Migration
  def change
    remove_column :walks, :desk
    remove_column :walks, :building
    remove_column :walks, :latitude
    remove_column :walks, :longitude
    remove_column :walks, :full_street_address
    add_column    :walks, :location_id, :integer
  end
end
