class RemoveBeginLocation < ActiveRecord::Migration
  def change
    remove_column :walks, :begin_location
  end
end
