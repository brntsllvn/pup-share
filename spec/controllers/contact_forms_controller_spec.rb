require 'rails_helper'

describe ContactFormsController do

  describe 'GET #new' do
    it 'assigns a new contact_form to @contact_form' do
      get :new
      expect(assigns(:contact_form)).to be_a_new(ContactForm)       
    end
  end #GET #new

  describe 'POST #create' do

    context 'valid params' do
      it 'saves the new job' do
        expect{ post :create, contact_form: attributes_for(:contact_form) }.to change(ContactForm, :count).by(1)
      end

      it 'redirects' do
        post :create, contact_form: attributes_for(:contact_form)
        expect(response).to redirect_to root_path
      end

      it 'notifies' do
        post :create, contact_form: attributes_for(:contact_form)
        expect(flash[:notice]).to eql 'Thanks for reaching out!'
      end
    end # 'valid params' 

    context 'invalid params' do
      it 'does not save' do
        expect{ post :create, contact_form: attributes_for(:invalid_contact_form) }.not_to change(ContactForm, :count)
      end

      it 're-renders' do 
        post :create, contact_form: attributes_for(:invalid_contact_form)
        expect(response).to render_template :new
      end

    end # 'invalid params'

  end #POST #create

end
