class WalksCompleted < ActiveRecord::Migration
  def change
    add_column :users, :walks_completed, :integer, default: 0
  end
end
