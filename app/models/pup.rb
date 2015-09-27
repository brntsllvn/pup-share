class Pup < ActiveRecord::Base
  validates :name,           presence: true
  validates :breed,          presence: true
  validates :male_female,    presence: true
  validates :vet_phone,      presence: true, 
  format: { with: /\d{3}-\d{3}-\d{4}/, message: 'Please format like: 555-555-5555' }
  validates :age,            presence: true, numericality: true

  belongs_to :user
  belongs_to :owner, class_name: 'User'
  belongs_to :walker, class_name: 'User'
  has_many :walks, dependent: :destroy

  mount_uploader :pic, PupPicUploader

end