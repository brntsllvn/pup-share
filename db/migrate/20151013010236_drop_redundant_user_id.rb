class DropRedundantUserId < ActiveRecord::Migration
  def change
    remove_column :offers, :user_id
  end
end
