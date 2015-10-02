class CleanUpUserModel < ActiveRecord::Migration
  def change
    remove_column :users, :ssn_last_four
    remove_column :users, :password_digest
    remove_column :users, :publishable_key
    remove_column :users, :secret_key
    remove_column :users, :stripe_user_id
    remove_column :users, :stripe_account_type
    remove_column :users, :stripe_account_status
    remove_column :users, :currency_symbol

    add_column :users, :address_desk,     :string
    add_column :users, :address_building, :string
    add_column :users, :address_street,   :string
    add_column :users, :address_city,     :string
    add_column :users, :address_zip_code, :string
    add_column :users, :address_state,    :string
    add_column :users, :address_country,  :string
  end
end
