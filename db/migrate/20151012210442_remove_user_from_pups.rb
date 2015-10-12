class RemoveUserFromPups < ActiveRecord::Migration
  def change
    remove_column :pups, :user_id
  end
end
