class RemoveWalkFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :walk_id
  end
end
