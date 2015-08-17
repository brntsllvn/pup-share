class SetUserFieldDefaults < ActiveRecord::Migration
  def change
    # change_column :people, :last_name, :default => "Doe"
    change_column :users, :first_name, :string, default: ""
    change_column :users, :last_name, :string, default: ""
    change_column :users, :phone, :string, default: ""
    change_column :users, :emergency_phone, :string,  default: ""
    change_column :users, :building, :string, default: ""
  end
end
