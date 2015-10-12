# require 'rails_helper'

# describe User do

#   # not necessary to include count for any of the factories below,
#   # as they are defined in each factory, but I am including them as
#   # reminders
#   # let(:jim_bob) { create(:user_w_walks_and_offers, upcoming_walks_count: 3, offers_count: 3) }
#   # number of past_walks is set to 3, see users Factory for clarification
#   subject { create(:user) }

#   describe '#upcoming_walks' do
#     before do
#       3.times do
#         create(:walk, owner: jim_bob)
#       end
#     end
#     it 'returns all upcoming walks' do
#       expect(subject.upcoming_walks.count).to eq 3
#     end
#   end

#   describe '#upcoming_walks_through_offers' do
#     before do
#       3.times do
#         create(:offer, walker: jim_bob)
#       end
#     end
#     it 'returns all upcoming walks where a given user made an offer' do
#       expect(subject.upcoming_walks_through_offers.count).to eq 3
#     end
#   end

#   describe '#upcoming_walks_and_offers' do
#     it 'returns all upcoming walks and offer-walks for a given user' do
#       expect(subject.upcoming_walks_and_offers.count).to eq 6
#     end
#   end

#   describe '#past_walks' do
#     it 'returns all past walks' do
#       expect(subject.past_walks.count).to eq 3
#     end
#   end

#   describe '#past_walks_through_offers' do
#     it 'returns all past walks where a given user made an offer' do
#       expect(subject.past_walks_through_offers.count).to eq 0 # all walks minus future walks
#     end
#   end

#   describe '#past_walks_and_offers' do
#     it 'success' do
#       expect(subject.past_walks_and_offers.count).to eq 3 # all walks minus future walks
#     end
#   end
# end