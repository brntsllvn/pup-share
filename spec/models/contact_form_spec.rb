require 'rails_helper'

describe ContactForm do

  # validations

  it 'is valid with name, email, company, type, comment' do
    contact_form = build(:contact_form)
    expect(contact_form).to be_valid
  end

  it 'is invalid without name' do
    contact_form = build(:contact_form, name: nil)
    contact_form.valid?
    expect(contact_form.errors[:name]).to include "can't be blank"
  end

  it 'is invalid without email' do
    contact_form = build(:contact_form, email: nil)
    contact_form.valid?
    expect(contact_form.errors[:email]).to include "can't be blank"
  end

  it 'is invalid without company' do
    contact_form = build(:contact_form, company: nil)
    contact_form.valid?
    expect(contact_form.errors[:company]).to include "can't be blank"
  end

  it 'is invalid without type' do
    contact_form = build(:contact_form, contact_type: nil)
    contact_form.valid?
    expect(contact_form.errors[:contact_type]).to include "can't be blank"
  end

  it 'is invalid withouout comment' do
    contact_form = build(:contact_form, comment: nil)
    contact_form.valid?
    expect(contact_form.errors[:comment]).to include "can't be blank"
  end

  it 'is invalid is email does not have \@' do
    contact_form = build(:contact_form, email: 'brnt.brnt')
    contact_form.valid?
    expect(contact_form.errors[:email]).to include "Need a valid email address"
  end

  # methods

end
