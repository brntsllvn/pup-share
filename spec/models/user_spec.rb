require 'rails_helper'

describe User do

  # not necessary to include count for any of the factories below,
  # as they are defined in each factory, but I am including them as
  # reminders
  let(:jim_bob) { create(:user_w_walks_and_offers, upcoming_walks_count: 3, offers_count: 3) }
  # number of past_walks is set to 3, see users Factory for clarification

  describe '.upcoming_walks' do
    it 'returns all upcoming walks' do
      expect(jim_bob.upcoming_walks.count).to eq 3
    end
  end

  describe '.upcoming_walks_through_offers' do
    it 'returns all upcoming walks where a given user made an offer' do
      expect(jim_bob.upcoming_walks_through_offers.count).to eq 3
      expect(jim_bob.upcoming_walks_through_offers.first).to be_a Walk
    end
  end

  describe '.upcoming_walks_and_offers' do
    it 'returns all upcoming walks and offer-walks for a given user' do
      expect(jim_bob.upcoming_walks_and_offers.count).to eq 6
      expect(jim_bob.upcoming_walks_and_offers.first).to be_a Walk
      expect(jim_bob.upcoming_walks_and_offers.last).to  be_a Walk    
    end
  end

  describe '.past_walks' do
    it 'returns all past walks' do
      expect(jim_bob.past_walks.count).to eq 3
    end
  end

  describe '.past_walks_through_offers' do
    it 'returns all past walks where a given user made an offer' do
      expect(jim_bob.past_walks_through_offers.count).to eq 0 # all walks minus future walks
    end
  end

  describe '.past_walks_and_offers' do
    it '' do
      expect(jim_bob.past_walks_and_offers.count).to eq 3 # all walks minus future walks
    end
  end


end