require 'rails_helper'

describe Job do

  # validations

  it 'is valid with drop-off time, drop-off location, pick_up_time, pick_up_location, pup, user, owner first name, owner last name, owner phone, emergency phone and building' do
    job = build(:job, pup_id: 1, user_id: 1)  
    expect(job).to be_valid
  end

  it 'is invalid without drop_off_time' do
    job = build(:job, pup_id: 1, user_id: 1, drop_off_time: nil)
    job.valid?
    expect(job.errors[:drop_off_time]).to include("can't be blank")
  end

  it 'is invalid without drop_off_location' do
    job = build(:job, pup_id: 1, user_id: 1, drop_off_location: nil)
    job.valid?
    expect(job.errors[:drop_off_location]).to include("can't be blank")    
  end

  it 'is invalid without pick_up_location' do
    job = FactoryGirl.build(:job, pup_id: 1, user_id: 1, pick_up_location: nil)
    job.valid?
    expect(job.errors[:pick_up_location]).to include("can't be blank")     
  end

  it 'is invalid without pup_id' do
    job = FactoryGirl.build(:job, pup_id: nil, user_id: 1)
    job.valid?
    expect(job.errors[:pup_id]).to include("can't be blank")     
  end

  it 'is invalid without user_id' do
    job = FactoryGirl.build(:job, pup_id: 1, user_id: nil)
    job.valid?
    expect(job.errors[:user_id]).to include("can't be blank")     
  end

  context 'is invalid without owner' do
    it 'first name' do
      job = FactoryGirl.build(:job, pup_id: 1, owner_first_name: nil)
      job.valid?
      expect(job.errors[:owner_first_name]).to include("can't be blank")   
    end

    it 'last name' do
      job = FactoryGirl.build(:job, pup_id: 1, owner_last_name: nil)
      job.valid?
      expect(job.errors[:owner_last_name]).to include("can't be blank") 
    end

    it 'phone' do
      job = FactoryGirl.build(:job, pup_id: 1, owner_phone: nil)
      job.valid?
      expect(job.errors[:owner_phone]).to include("can't be blank") 
    end

    it 'formatted phone' do
      job = FactoryGirl.build(:job, pup_id: 1, owner_phone: '1234')
      job.valid?
      expect(job.errors[:owner_phone]).to include("Format: 555-555-5555. We will store this value so you do not need to enter it again.") 
    end

    it 'emergency phone' do
      job = FactoryGirl.build(:job, pup_id: 1, owner_emergency_phone: nil)
      job.valid?
      expect(job.errors[:owner_emergency_phone]).to include("can't be blank")   
    end

    it 'formatted emergency phone' do
      job = FactoryGirl.build(:job, pup_id: 1, owner_emergency_phone: '1234')
      job.valid?
      expect(job.errors[:owner_emergency_phone]).to include("Format: 555-555-5555. We will store this value so you do not need to enter it again.") 
    end

    it 'building' do
      job = FactoryGirl.build(:job, pup_id: 1, owner_building_name: nil)
      job.valid?
      expect(job.errors[:owner_building_name]).to include("can't be blank") 
    end
  end # 'is invalid without owner'

  # methods

  let(:user) { FactoryGirl.create(:user) }
  let(:job)  { FactoryGirl.create(:job, walker_id: user.id) }
  let(:pup)  { FactoryGirl.create(:pup, job_id: job.id, user_id: user.id) }

  it '.hide makes hidden true' do
    job.hide
    expect(job.hidden).to be true
  end

  context '.update_follow_up_attr' do
    it 'does nothing if job is hidden' do
      job.hide
      expect(job.update_follow_up_attr('anything')).to eq 'Feedback previously recorded for this walk'
    end

    #     it 'updates the job' do
    #       job.update_follow_up_attr('stars_5')
    #       expect(job).to have_attributes(how_did_it_go: 'stars_5', hidden: true)
    #     end

    it 'increments the walker\'s walks completed count' do
      expect { job.update_follow_up_attr('stars_5') }.to change{User.find(job.walker_id).walks_completed}.from(0).to(1)
    end

    it 'increments the pup walk completed count' do
      expect { job.update_follow_up_attr('stars_5') }.to change{job.pup.walks_completed}.from(0).to(1)
    end

    #     it 'updates the feedback with five stars after the first walk' do
    #       expect { job.update_follow_up_attr('stars_5') }.to change{User.find(job.walker_id).feedback_rating}.from(0).to(5)  
    #     end

    #     it 'updates the feedback with one star after the first walk' do
    #       expect { job.update_follow_up_attr('stars_1') }.to change{User.find(job.walker_id).feedback_rating}.from(0).to(1)  
    #     end

    #     context 'does the averaging math correctly' do
    #       it 'adding in a 5 star rating' do
    #         user = FactoryGirl.create(:user, walks_completed: 20, feedback_rating: 3.6)
    #         job = FactoryGirl.create(:job, walker_id: user.id)
    #         expect { job.update_follow_up_attr('stars_5') }.to change{User.find(job.walker_id).feedback_rating.round(2) }.from(user.feedback_rating).to(3.84)     
    #       end

    #       it 'adding in a 2 star rating' do
    #         user = FactoryGirl.create(:user, walks_completed: 150, feedback_rating: 2.96)
    #         job = FactoryGirl.create(:job, walker_id: user.id)
    #         expect { job.update_follow_up_attr('stars_2') }.to change{User.find(job.walker_id).feedback_rating.round(2) }.from(user.feedback_rating).to(2.97)     
    #       end
    #     end # 'does the averaging math correctly'

    #     it 'returns a notice' do
    #       expect(job.update_follow_up_attr('awesome')).to eq 'Feedback recorded. Thanks!'
    #     end 
  end # update_follow_up_attr

end