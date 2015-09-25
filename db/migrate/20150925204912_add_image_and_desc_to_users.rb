class AddImageAndDescToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :headline, :string
  end
end
