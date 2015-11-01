class DefaultLongitude < ActiveRecord::Migration
  def change
    change_column :locations, :latitude, :float, default: 34.6663093
    change_column :locations, :longitude, :float, default: -120.1366846
  end
end
