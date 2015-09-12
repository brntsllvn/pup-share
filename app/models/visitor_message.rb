class VisitorMessages < ActiveRecord::Base
  validates :name,              presence: true
  validates :email,             presence: true
  validates :type,              presence: true
  validates :message,           presence: true
  validates_format_of :email, with: /.{1,50}@/, message: "Need a valid email address"  
end