class User < ActiveRecord::Base
  serialize :auth_hash, Hash

  has_many :walks, dependent: :destroy
  has_many :pups, dependent: :destroy
  has_many :offers, dependent: :destroy

  # TODO: test this (create dummy auth hash and call find_or_create_by_hash)
  def self.find_or_create_by_hash(auth)
    user = where(provider: auth[:provider], uid: auth[:uid]).first
    if user
      # TODO: extract to another instance method for 
      # single responsbility and easier testing
      user.first_name = auth[:info][:first_name], # ??? TODO: value changes after user.save...???
      user.last_name  = auth[:info][:last_name],
      user.email      = auth[:info][:email],
      user.image      = auth[:info][:image],
      user.headline   = auth[:info][:description],
      user.auth_hash  = auth
      user.save
    else
      create(
        provider:   auth[:provider], 
        uid:        auth[:uid], 
        first_name: auth[:info][:first_name],
        last_name:  auth[:info][:last_name],
        email:      auth[:info][:email],
        image:      auth[:info][:image],
        headline:   auth[:info][:description],
        auth_hash:  auth
        )
    end
  end
end