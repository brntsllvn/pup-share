class ChangeColName < ActiveRecord::Migration
  def change
    rename_column :visitor_messages, :type, :message_type
  end
end
