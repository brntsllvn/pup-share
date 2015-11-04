class RemoveWalksCompleted < ActiveRecord::Migration
  def change
    remove_column :pups, :walks_completed
    remove_column :users, :walks_completed
  end
end
