class User < ActiveRecord::Base
  serialize :auth_hash, Hash

  has_many :walks, dependent: :destroy
  has_many :pups, dependent: :destroy
  has_many :offers, dependent: :destroy

  # Passes hash to built-in Rails method
  def self.find_or_create_by_hash(auth) 
    User.find_or_create_by(provider: auth[:provider], uid: auth[:uid]) do |user|
      user.first_name = auth[:info][:first_name]
      user.last_name  = auth[:info][:last_name]
      user.email      = auth[:info][:email]
      user.image      = auth[:info][:image]
      user.headline   = auth[:info][:description]
      user.auth_hash  = auth
    end
  end

end