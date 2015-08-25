require 'rails_helper'


describe User do

  #   # validations

  #   it 'is valid with an email, first and last names, phone and emergency phone' do
  #     user = FactoryGirl.build(:user)
  #     expect(user).to be_valid
  #   end

  #   it 'is invalid without an email' do
  #     user = FactoryGirl.build(:user, email: nil)
  #     user.valid?
  #     expect(user.errors[:email]).to include('can\'t be blank')
  #   end

  #   it 'is valid with an @amazon.com email' do
  #     user = FactoryGirl.build(:user)
  #     expect(user).to be_valid
  #   end

  #   it 'is invalid without an @amazon.com email' do
  #     user = FactoryGirl.build(:invalid_user)
  #     user.valid?
  #     expect(user.errors[:email]).to include("Email address must have @amazon.com domain")
  #   end

  #   context 'is invalid without owner' do
  #     it 'first name' do
  #       job = FactoryGirl.build(:user, first_name: nil)
  #       job.valid?
  #       expect(job.errors[:first_name]).to include("can't be blank")   
  #     end

  #     it 'last name' do
  #       job = FactoryGirl.build(:user, last_name: nil)
  #       job.valid?
  #       expect(job.errors[:last_name]).to include("can't be blank")  
  #     end

  #     it 'phone' do
  #       job = FactoryGirl.build(:user, phone: nil)
  #       job.valid?
  #       expect(job.errors[:phone]).to include("can't be blank")  
  #     end

  #     it 'formatted phone' do
  #       job = FactoryGirl.build(:user, phone: '1234')
  #       job.valid?
  #       expect(job.errors[:phone]).to include("Format: 555-555-5555") 
  #     end

  #     it 'emergency phone' do
  #       job = FactoryGirl.build(:user, emergency_phone: nil)
  #       job.valid?
  #       expect(job.errors[:emergency_phone]).to include("can't be blank")   
  #     end

  #     it 'formatted emergency phone' do
  #       job = FactoryGirl.build(:user, emergency_phone: '1234')
  #       job.valid?
  #       expect(job.errors[:emergency_phone]).to include("Format: 555-555-5555") 
  #     end

  #     it 'building' do
  #       job = FactoryGirl.build(:user, building: nil)
  #       job.valid?
  #       expect(job.errors[:building]).to include("can't be blank")  
  #     end
  #   end # 'is invalid without owner'

  # methods

  let(:owner)    { create(:user) }
  let(:job1)     { create(:job, user_id: owner.id) }
  let(:request2) { create(:request, user_id: owner.id, job_id: job2.id)}  

  let(:walker)   { create(:user) }
  let(:job2)     { create(:job, user_id: walker.id) }
  let(:request1)  { create(:request, user_id: walker.id, job_id: job1.id)}

  let(:pup1)     { create(:pup, user_id: owner.id, hidden: true) }
  let(:pup2)     { create(:pup, user_id: owner.id, hidden: false) }

  let(:user)     { create(:user) }

  before :each do
    walker.requests << request1
    owner.requests << request2
  end

  #   context '.walker_jobs' do
  #     it 'returns jobs assocaited with a user\'s requests' do
  #       expect(walker.walker_jobs).to eq ([job1])
  #     end

  #     it 'returns nothing with a user has no requests' do
  #       empty_walker = FactoryGirl.create(:user)
  #       expect(empty_walker.walker_jobs).to be_empty
  #     end
  #   end

  #   context '.all_my_jobs' do
  #     it 'returns all jobs a user is related to' do
  #       expect(owner.all_my_jobs).to eq ([job1,job2])
  #     end

  #     it '...or an empty array' do
  #       expect(user.all_my_jobs).to eq ([])
  #     end
  #   end

  it '.all_pups_not_hidden' do
    expect(owner.all_pups_not_hidden).to eq ([pup2])
  end

end