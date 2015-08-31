require 'rails_helper'

describe 'user sign up' do
  before do
    # visit  '/'
    # click_link 'sign up'

    # expect to see sign up form
  end

  context 'succes' do
    before do
      # fill form with valid credentials
      # submit form
    end

    it 'creates user'
    it 'sends confirmation email'
    it 'shows confirmation instructions'
    it 'shows confirmation form'
  end

  context 'failure' do
    it 'does not create user'
    it 'does not send confirmation email'

    it 'shows sign up form'
    it 'shows error list'
  end

  context 'fails when' do
    it 'email missing'
    it 'password and confirmation not matching'
  end
end


describe 'user sign in' do
  context 'succes' do
    it 'greets user'
    it 'shows dashboard'
  end

  context 'failure' do
    it 'shows sign in form'
    it 'shows error list'
  end

  context 'fails when' do
    it 'email is not registered'
    it 'password is wrong'
    it 'account is locked'
  end
end
