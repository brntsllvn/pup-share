class Pup < ActiveRecord::Base
#   validates :name,           presence: true
#   validates :pup_gender,         presence: true
#   validates :pup_vet_phone,      presence: true, 
#   format: { with: /\d{3}-\d{3}-\d{4}/, message: 'Please format like: 555-555-5555' }
#   validates :pup_age,            presence: true, numericality: true
#   validates :spayed_neutered,    presence: true
#   validates :pup_breed,          presence: true

  belongs_to :user
  has_many :walks, dependent: :destroy

  mount_uploader :pic, PupPicUploader

end
