class Pup < ActiveRecord::Base
  validates :name,           presence: true
  validates :breed,          presence: true
  validates :male_female,    presence: true
  validates :age,            presence: true
  validates :weight,         presence: true

  # belongs_to :user
  belongs_to :owner, class_name: 'User'

  has_many :walks, dependent: :destroy
  has_many :walkers, through: :walks

  mount_uploader :pic, PupPicUploader

end