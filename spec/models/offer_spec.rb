require 'rails_helper'

describe Offer do
  subject { create :offer }

  it 'has valid factory' do
    expect(subject).to be_valid
  end
end