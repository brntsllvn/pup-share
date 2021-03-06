class User < ActiveRecord::Base
  acts_as_paranoid # soft delete

  serialize :auth_hash, Hash

  has_many :walks_as_owner, dependent: :destroy, class_name: 'Walk', foreign_key: :owner_id

  has_many :pups, dependent: :destroy, foreign_key: :owner_id
  has_many :offers, dependent: :destroy, foreign_key: :walker_id

  has_many :walks_as_walker, through: :offers, class_name: 'Walk', source: :walk

  has_many :locations, dependent: :destroy, foreign_key: :owner_id
  has_many :phone_numbers, dependent: :destroy, foreign_key: :owner_id
  has_many :visitor_messages

  # Passes hash to built-in Rails method; no need to test
  def self.find_or_create_by_hash(auth)

    user = User.find_or_create_by(provider: auth[:provider], uid: auth[:uid])

    user.update_attributes(
      first_name:      auth[:info][:first_name],
      last_name:       auth[:info][:last_name],
      email:           auth[:info][:email],
      image:           auth[:info][:image],
      headline:        auth[:info][:description],
      linkedin_url:    auth[:info][:urls][:public_profile],
      location:        auth[:info][:location][:name],
      auth_hash:       auth
      )
  end

end