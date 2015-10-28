class AddWinningOfferIdToWalks < ActiveRecord::Migration
  def change
    add_column :walks, :winning_offer_id, :integer
    remove_column :walks, :walker_id
  end
end
