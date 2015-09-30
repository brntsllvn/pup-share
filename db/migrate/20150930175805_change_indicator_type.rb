class ChangeIndicatorType < ActiveRecord::Migration
  def change
    remove_column :walks, :owner_started
    remove_column :walks, :walker_started
    remove_column :walks, :owner_ended
    remove_column :walks, :walker_ended

    add_column :walks, :started_by_owner, :boolean, default: false
    add_column :walks, :started_by_walker, :boolean, default: false
    add_column :walks, :ended_by_owner, :boolean, default: false
    add_column :walks, :ended_by_walker, :boolean, default: false
  end
end
