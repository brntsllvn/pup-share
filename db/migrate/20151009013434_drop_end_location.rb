class DropEndLocation < ActiveRecord::Migration
  def change
    remove_column :walks, :end_location
  end
end
