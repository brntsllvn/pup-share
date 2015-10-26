class AddVisitorMessagesToUserModel < ActiveRecord::Migration
  def change
    remove_column :visitor_messages, :name
    remove_column :visitor_messages, :email
    add_column :visitor_messages, :user_id, :integer
  end
end
