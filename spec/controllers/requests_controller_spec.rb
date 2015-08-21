require 'rails_helper'

describe RequestsController do 

  let(:requested_of_user) { create(:user) }
  let(:job) { create(:job) }

  describe 'GET #index' do
    before :each do
      sign_in @user = create(:user) 
    end

    let(:job1)     { create(:job, user_id: @user.id, drop_off_time: DateTime.now + 1.year) }
    let(:job2)     { create(:job, user_id: @user.id, drop_off_time: DateTime.now - 1.year) }
    let(:request1) { create(:request, user_id: @user.id, status: 'approved', job_id: rjob1.id) }
    let(:request2) { create(:request, user_id: @user.id, job_id: rjob2.id) }    

  end #GET #index

  describe 'GET #new' do
    it 'assigns a new request to @request' do
      sign_in @user = create(:user) 
      get :new, id: request, user_id: @user.id
      expect(assigns(:request)).to be_a_new(Request)       
    end
  end #GET #new

  describe 'GET #edit' do

    let(:user) { FactoryGirl.create(:user) } 
    let(:requested_of_user) { FactoryGirl.create(:user) } 
    let(:my_request) { FactoryGirl.create(:request, user_id: user.id,
      requested_of_user_id: requested_of_user.id, job_id: job.id) }

    context 'request exists' do
      it 'and redirects to the user dashboard' do
        get :edit, id: my_request, user_id: user.id
        expect(response).to redirect_to jobs_path
      end

      it 'and status is approved' do 
        get :edit, id: my_request, user_id: user.id, status: 'approved'
        expect(flash[:notice]).to eq 'Request approved'         
      end

      it 'and walk declined notifies' do
        get :edit, id: my_request, user_id: user.id, status: 'declined'
        expect(flash[:notice]).to eq 'Request declined' 
      end

      it 'and walk cancelled notifies' do
        get :edit, id: my_request, user_id: user.id, status: 'cancelled'
        expect(flash[:notice]).to eq 'Walk cancelled' 
      end
    end # request exists

    context 'request no longer exists' do
      before :each do
        sign_in user = FactoryGirl.create(:user) 
      end

      it 'alerts the user' do
        get :edit, id: 999, user_id: user.id
        expect(flash[:alert]).to eq 'Sorry. The walk no longer exists' 
      end

      it 'notices the record was not found' do
        get :edit, id: 999, user_id: user.id        
        expect(response).to redirect_to jobs_path
      end
    end
  end

  describe 'POST #create' do

    before :each do
      sign_in @user = FactoryGirl.create(:user)
      request.env["HTTP_REFERER"] = user_path(@user)
    end

    let(:requested_of_user) { FactoryGirl.create(:user) }
    let(:job) { FactoryGirl.create(:job) }
    let(:request_attr) { FactoryGirl.attributes_for(:request, user_id: @user, requested_of_user_id: requested_of_user, job_id: job) }

    it 'saves the new request in the database' do
      expect{
        post :create, user_id: @user.id, request: request_attr
        }.to change(Request, :count).by(1)
    end

    it 'notifies the requester' do
      post :create, user_id: @user.id, request: request_attr
      expect(flash[:notice]).to eq "Offer to walk sent to the owner. You will receive an email with their response. Thanks!"
    end

    it 'redirects back to the referring page' do
      post :create, user_id: @user.id, request: request_attr
      expect(response).to redirect_to user_path(@user)
    end
  end

  describe 'DELETE #destroy' do

    before :each do
      sign_in @user = FactoryGirl.create(:user) 
      request.env["HTTP_REFERER"] = user_path(@user)
      @walk_request = FactoryGirl.create(:request, user: @user)
    end

    #let(:walk_request) { FactoryGirl.create(:request, user: @user) }

    context 'when record found' do
      it 'deletes the request from the database' do
        # binding.pry
        expect{delete :destroy, user_id: @user.id, id: @walk_request}.to change(Request, :count).by(-1)
      end

      it 'redirects to user dashboard' do
        delete :destroy, user_id: @user.id, id: @walk_request
        expect(response).to redirect_to user_path(@user)
      end  

      it 'notifies the requester' do
        delete :destroy, user_id: @user.id, id: @walk_request
        expect(flash[:alert]).to eq 'Walk cancelled'
      end
    end # when record found 

    context 'when record not found' do
      it 'alerts the user' do
        delete :destroy, id: 999, user_id: @user.id
        expect(flash[:alert]).to eq 'Sorry. The walk no longer exists' 
      end
    end # 'when record not found'

  end # destroy

end # RequestsController