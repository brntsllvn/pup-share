require 'rails_helper'

describe User do

  let(:owner)        { create(:user_with_upcoming_walks, upcoming_walks_count: 3) }
  let(:walker)       { create(:walker, offers_count: 4) }
  let(:awesome_user) { create(:user_w_upcoming_walks_and_offers, upcoming_walks_count: 1, offers_count: 3) }

  describe '.upcoming_walks' do
    it 'returns all upcoming walks' do
      expect(owner.upcoming_walks.count).to eq 3
    end
  end

  describe '.upcoming_walks_through_offers' do
    it 'returns all upcoming walks where a given user made an offer' do
      expect(walker.upcoming_walks_through_offers.count).to eq 4
      expect(walker.upcoming_walks_through_offers.first).to be_a Walk
    end
  end

  describe '.upcoming_walks_and_offers' do
    it 'returns all upcoming walks and offer-walks for a given user' do
      expect(awesome_user.upcoming_walks_and_offers.count).to eq 4
      expect(awesome_user.upcoming_walks_and_offers.first).to be_a Walk
      expect(awesome_user.upcoming_walks_and_offers.last).to  be_a Walk    
    end
  end

end