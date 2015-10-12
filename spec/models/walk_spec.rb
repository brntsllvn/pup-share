require 'rails_helper'

describe Walk do

  let(:near_walk) { create(:walk, begin_time: Time.now + 15.minutes) }
  let(:far_walk)  { create(:walk, begin_time: Time.now + 5.years) }
  
  describe '#coming_up?' do
    it 'success' do
      expect(near_walk.coming_up?).to be true
      expect(far_walk.coming_up?).to be false   
    end
  end
end