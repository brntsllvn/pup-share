class Pup < ActiveRecord::Base
  acts_as_paranoid # soft delete

  validates :name,           presence: true
  validates :breed,          presence: true
  validates :male_female,    presence: true
  validates :age,            presence: true
  validates :size,           presence: true
  validates :personality,    presence: true

  belongs_to :owner, class_name: 'User'
  has_many :walks, dependent: :destroy

  mount_uploader :pic, PupPicUploader

end