require 'rails_helper'

describe Offer do
  subject { create :offer }

  it 'has valid factory' do
    expect(subject).to be_valid
  end
  
  it 'sends an email' do
    expect { subject.send_offer_notifier_email }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
  
end