class PhoneNumber < ActiveRecord::Base
  validates :number,   presence: true

  belongs_to :owner, class_name: 'User'
  has_many :walks

end