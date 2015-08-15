require "rails_helper"

describe ContactMailer do
  include ActiveJob::TestHelper

  let(:contact_form) { create(:contact_form) }

  before :each do
    ContactMailer.contact_mailer(contact_form).deliver_now 
  end

  let(:delivered_emails) { ActionMailer::Base.deliveries }
  let(:contact_form_mailer) { delivered_emails.first }
  
  it 'delivers one email' do
    expect(delivered_emails.count).to eq(1)
  end

  it 'delivered from the default' do
    expect(contact_form_mailer).to be_delivered_from 'no-reply@PupShare.com'
  end

  it 'delivered to me' do
    expect(contact_form_mailer).to be_delivered_to 'brntsllvn@gmail.com'
  end

end
