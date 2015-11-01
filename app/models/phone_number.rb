class PhoneNumber < ActiveRecord::Base
  acts_as_paranoid # soft delete

  # Normalizes the attribute itself before validation
  phony_normalize :number, default_country_code: 'US'

  validates :number, phony_plausible: true
  validates :number,   presence: true

  belongs_to :owner, class_name: 'User'
  has_many :walks, dependent: :destroy

end