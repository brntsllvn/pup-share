class Pup < ActiveRecord::Base
  validates :pup_name,           presence: true
  validates :pup_weight,         presence: true
  validates :pup_gender,         presence: true
  validates :pup_vet_phone,      presence: true, 
  format: { with: /\d{3}-\d{3}-\d{4}/, message: 'Please format like: 555-555-5555' }
  validates :pup_age,            presence: true, numericality: true
  validates :spayed_neutered,    presence: true
  validates :pup_breed,          presence: true

  belongs_to :user
  has_many :jobs, dependent: :destroy

  mount_uploader :pup_pic, PupPicUploader

  def hide
    self.update_attributes hidden: true
  end

end
