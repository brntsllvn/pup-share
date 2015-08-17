class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true,
  format: { with: /\d{3}-\d{3}-\d{4}/, message: 'Format: 555-555-5555' }
  validates :emergency_phone, presence: true,
  format: { with: /\d{3}-\d{3}-\d{4}/, message: 'Format: 555-555-5555' }
  validates :building, presence: true
  
  validates_format_of :email, with: /.{1,50}@amazon.com/, 
  message: "Email address must have @amazon.com domain"  

  has_many :jobs, dependent: :destroy
  has_many :pups, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :requests, dependent: :destroy

  mount_uploader :pic, UserPicUploader

  def all_pups_not_hidden
    self.pups.where(hidden: false)
  end

end
