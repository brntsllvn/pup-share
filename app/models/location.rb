class Location < ActiveRecord::Base
  validates :full_street_address,   presence: true
  
  belongs_to :owner, class_name: 'User'
  has_many :walks

  geocoded_by :full_street_address    # Geocoder note: can also be an IP address
  after_validation :geocode          # Geocoder note: auto-fetch coordinates

end