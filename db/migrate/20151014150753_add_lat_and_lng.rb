class AddLatAndLng < ActiveRecord::Migration
  def change
    add_column :walks, :latitude, :float
    add_column :walks, :longitude, :float
  end
end
