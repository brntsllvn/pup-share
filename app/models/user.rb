class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  validates_format_of :email, with: /.{1,50}@amazon.com/, 
  message: "Email address must have @amazon.com domain"  

  has_many :jobs, dependent: :destroy
  has_many :pups, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :requests, dependent: :destroy

  mount_uploader :pic, UserPicUploader

#   def walker_jobs
#     walker_jobs = []
#     self.requests.each do |request|
#       walker_jobs << request.job      
#     end
#     return walker_jobs
#   end

#   def all_my_jobs
#     empty_arr = []
#     all_my_jobs = self.jobs + self.walker_jobs
#     return all_my_jobs unless all_my_jobs.nil?
#     return empty_arr
#   end

  def all_pups_not_hidden
    self.pups.where(hidden: false)
  end

end
