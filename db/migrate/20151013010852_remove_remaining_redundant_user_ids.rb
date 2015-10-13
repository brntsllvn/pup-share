class RemoveRemainingRedundantUserIds < ActiveRecord::Migration
  def change
    remove_column :walks, :user_id
    
  end
end
