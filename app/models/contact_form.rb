class ContactForm < ActiveRecord::Base
  validates :name,              presence: true
  validates :email,             presence: true
  validates :company,           presence: true
  validates :contact_type,      presence: true
  validates :comment,           presence: true
end