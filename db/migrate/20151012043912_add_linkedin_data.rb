class AddLinkedinData < ActiveRecord::Migration
  def change
    add_column :users, :linkedin_url, :string
    add_column :users, :location, :string
  end
end
