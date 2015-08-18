require 'rails_helper'

describe Pup do

  # validations

  let(:pup) { FactoryGirl.create(:pup) }

  it 'is valid with name, weight, gender, vet phone, age, spayed\neutered' do
    expect(pup).to be_valid
  end

  it 'is invalid without name' do
    invalid_pup = FactoryGirl.build(:invalid_pup)
    invalid_pup.valid?
    expect(invalid_pup.errors[:pup_name]).to include("can't be blank")
  end

  it 'is invalid without weight' do
    invalid_pup = FactoryGirl.build(:pup, pup_weight: nil)
    invalid_pup.valid?
    expect(invalid_pup.errors[:pup_weight]).to include("can't be blank")
  end

  it 'is invalid without gender' do
    invalid_pup = FactoryGirl.build(:pup, pup_gender: nil)
    invalid_pup.valid?
    expect(invalid_pup.errors[:pup_gender]).to include("can't be blank")
  end

  it 'is invalid without vet phone' do
    invalid_pup = FactoryGirl.build(:pup, pup_vet_phone: nil)
    invalid_pup.valid?
    expect(invalid_pup.errors[:pup_vet_phone]).to include("can't be blank")
  end

  it 'is invalid without properly-formatted vet phone' do
    invalid_pup = FactoryGirl.build(:pup, pup_vet_phone: 'whoops')
    invalid_pup.valid?
    expect(invalid_pup.errors[:pup_vet_phone]).to include('Please format like: 555-555-5555')
  end

  it 'is invalid without age' do
    invalid_pup = FactoryGirl.build(:pup, pup_age: nil)
    invalid_pup.valid?
    expect(invalid_pup.errors[:pup_age]).to include("can't be blank") 
  end

  it 'is invalid without numeric age' do
    invalid_pup = FactoryGirl.build(:pup, pup_age: nil)
    invalid_pup.valid?
    expect(invalid_pup.errors[:pup_age]).to include('is not a number')
  end

  it 'is invalid without marking spayed\/neutered' do
    invalid_pup = FactoryGirl.build(:pup, spayed_neutered: nil)
    invalid_pup.valid?
    expect(invalid_pup.errors[:spayed_neutered]).to include("can't be blank")
  end

  it 'is invalid without breed' do
    invalid_pup = FactoryGirl.build(:pup, pup_breed: nil)
    invalid_pup.valid?
    expect(invalid_pup.errors[:pup_breed]).to include("can't be blank")
  end

  # methods

  it '.hide makes hidden true' do
    pup.hide
    expect(pup.hidden).to be true
  end

end