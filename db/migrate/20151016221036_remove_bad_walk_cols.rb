class RemoveBadWalkCols < ActiveRecord::Migration
  def change
    remove_column :walks, :ended_by_owner
    remove_column :walks, :started_by_owner
  end
end
