class AddUserId < ActiveRecord::Migration
  def change
    add_column :offers, :user_id, :integer
    add_column :pups,   :user_id, :integer
    add_column :walks,  :user_id, :integer
  end
end
