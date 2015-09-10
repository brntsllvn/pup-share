require 'rails_helper'

describe Request do

  let(:job) { create(:job) }
  let(:user) { create(:user) } 
  let(:requested_of_user) { create(:user) } 
  let(:my_request) { create(:request, user_id: user.id, requested_of_user_id: requested_of_user.id, job_id: job.id) }
  let(:delayed_job_last_id) { 999 }

  it '.walk_request updates status' do
    my_request.walk_request
    expect(my_request.status).to eq 'pending' 
  end

  context '.approve_walk_request' do

    it 'updates job walker' do
      my_request.approve_walk_request
      expect(my_request.job).to have_attributes(walker_id: user.id)
      # expect(my_request.job).to have_attributes(walker_id: user.id, enqueued_job_id: some_array.last.id)
    end

    it 'updates request status' do
      my_request.approve_walk_request
      expect(my_request.status).to eq 'approved' 
    end

    #     it 'updates the enqueued job id' do
    #       my_request.approve_walk_request
    #       expect(my_request.enqueued_job_id).to eq Delayed::Job.last.id
    #     end

    it 'returns a notice' do
      expect(my_request.approve_walk_request).to eq 'Request approved'       
    end

  end # '.approve_walk_request'

  context '.deny_walk_request' do
    it 'updates status' do
      my_request.deny_walk_request
      expect(my_request.status).to eq 'declined'
    end

    it 'returns a notice' do
      expect(my_request.deny_walk_request).to eq 'Request declined'
    end
  end # '.deny_walk_request' 

  context '.cancel_walk' do
    it 'updates status' do
      my_request.cancel_walk
      expect(my_request.status).to eq 'cancelled'
    end

    it 'returns a notice' do
      expect(my_request.cancel_walk).to eq 'Walk cancelled'
    end
  end # '.cancel_walk'

end # describe Request 