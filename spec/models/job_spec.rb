require 'rails_helper'

describe Job do

  #   let(:job) { build(:job, pup_id: 1, user_id: 1) }

  #   it 'valid factory' do
  #     expect(job).to be_valid
  #   end

  #   %w(drop_off_time drop_off_location walk_duration pick_up_location pup_id).each do |field|
  #     context "when #{field} missing" do
  #       it 'not valid' do
  #         job.update_attribute(field, nil)
  #         expect(job).not_to be_valid
  #       end
  #     end
  #   end

  # methods

  let(:user) { create(:user) }
  let(:job)  { create(:job, walker_id: user.id) }
  let(:pup)  { create(:pup, job_id: job.id, user_id: user.id) }

  it '.hide' do
    job.hide
    expect(job.hidden).to be true
  end

  context '.update_follow_up_attr' do
    #     it 'does nothing if job is hidden' do
    #       job.hide
    #       expect(job.update_follow_up_attr('anything')).to eq 'Feedback previously recorded for this walk'
    #     end

    #     it 'updates the job' do
    #       job.update_follow_up_attr('stars_5')
    #       expect(job).to have_attributes(how_did_it_go: 'stars_5', hidden: true)
    #     end

    it "increments the walker walks completed count" do
      expect { job.update_follow_up_attr('stars_5') }.to change{User.find(job.walker_id).walks_completed}.from(0).to(1)
    end

    it "increments the pup walks completed count" do
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