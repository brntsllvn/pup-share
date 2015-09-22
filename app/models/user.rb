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
      user.auth_hash = auth
      user.save
    else
      create(provider: auth[:provider], uid: auth[:uid], auth_hash: auth)
    end
  end

  def first_name
    self.auth_hash[:info][:first_name]
  end

  def last_name
    self.auth_hash[:info][:last_name]
  end

  def email
    self.auth_hash[:info][:email]
  end

  def image
    self.auth_hash[:info][:image]
  end

end