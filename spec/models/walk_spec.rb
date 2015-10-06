require 'rails_helper'

describe Walk do

  let(:near_walk) { create(:walk, begin_time: Time.now + 15.minutes) }
  let(:far_walk)  { create(:walk, begin_time: Time.now + 12.hours) }

  describe '.coming_up?' do
    it 'true' do
      expect(near_walk.coming_up? 60).to be true
      expect(near_walk.coming_up? 10).to be false   
      expect(far_walk.coming_up? 60).to be false
    end
  end
end