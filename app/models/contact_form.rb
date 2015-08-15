class ContactForm < ActiveRecord::Base
  validates :name,              presence: true
  validates :email,             presence: true
  validates :company,           presence: true
  validates :contact_type,      presence: true
  validates :comment,           presence: true
  validates_format_of :email, with: /.{1,50}@/, message: "Need a valid email address"  
end