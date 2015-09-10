class User < ActiveRecord::Base
  validates :first_name,               presence: true
  validates :last_name,                presence: true
  validates :phone,                    presence: true,
  format: { with: /\d{3}-\d{3}-\d{4}/, message: 'Format: 555-555-5555' }
  validates :emergency_phone,          presence: true,
  format: { with: /\d{3}-\d{3}-\d{4}/, message: 'Format: 555-555-5555' }
  
  has_many :jobs, dependent: :destroy
  has_many :pups, dependent: :destroy
  has_many :requests, dependent: :destroy

  mount_uploader :pic, UserPicUploader

end
