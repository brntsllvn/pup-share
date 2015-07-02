class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :first_name,            presence: true, length: { minimum: 2, maximum: 50 }
  # validates :last_name,             presence: true, length: { minimum: 2, maximum: 50 }
  # validates :building,              presence: true
  # validates :address,               presence: true, length: { minimum: 2, maximum: 100 }  
  # validates :phone,                 presence: true # consider using the 'format' validation later
  # validates :emergency_phone,       presence: true # consider using the 'format' validation later
  # validates_format_of :email, :with => /.{1,40}@amazon.com/, message: "Email addres must have an @amazon.com extension", on: :create  
#   validates :pic,                     presence: true
  
  has_many :jobs, dependent: :destroy
  has_many :pups, dependent: :destroy
  has_many :availabilities, dependent: :destroy
      
  mount_uploader :pic, UserPicUploader
  
end
