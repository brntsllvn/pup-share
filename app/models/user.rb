class User < ActiveRecord::Base
  serialize :auth_hash, Hash

  has_many :walks, dependent: :destroy
  has_many :pups, dependent: :destroy
  has_many :offers, dependent: :destroy

  mount_uploader :pic, UserPicUploader

  # TODO: test this (create dummy auth hash and call find_or_create_by_hash)
  def self.find_or_create_by_hash(auth)
    user =  where(provider: auth[:provider], uid: auth[:uid]).first
    if user
      # TODO: probably extract to another instance method for single responsbility and easier testing
      user.auth_hash = auth
      user.save.reload
    else
      create(provider: auth[:provider], uid: auth[:provider], auth_hash: auth)
    end
  end
end