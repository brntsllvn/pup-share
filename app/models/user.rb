class User < ActiveRecord::Base
  serialize :auth_hash, Hash

  has_many :walks_as_walker, dependent: :destroy, class_name: 'Walk', foreign_key: :walker_id
  has_many :walks_as_owner, dependent: :destroy, class_name: 'Walk', foreign_key: :owner_id

  has_many :pups, dependent: :destroy, foreign_key: :owner_id

  has_many :offers, dependent: :destroy

  # Passes hash to built-in Rails method; no need to test
  def self.find_or_create_by_hash(auth)

    user = User.find_or_create_by(provider: auth[:provider], uid: auth[:uid])

    user.update_attributes(
      first_name:   auth[:info][:first_name],
      last_name:    auth[:info][:last_name],
      email:        auth[:info][:email],
      image:        auth[:info][:image],
      headline:     auth[:info][:description],
      linkedin_url: auth[:info][:urls][:public_profile],
      location:     auth[:info][:location][:name],
      auth_hash:    auth
      )
  end

  def walks
    Walk.for_user(self)
  end


  #   def upcoming_walks_and_offers
  #     self.walks.upcoming 
  #     #       + self.walks.upcoming_walks_through_offers).uniq.sort_by{ |e| e[:begin_time] }
  #   end

  #   def past_walks_through_offers
  #     Walk.past.includes(:offers).where(offers: { user: self })
  #   end

  #   def past_walks_and_offers
  #     (walks.past + past_walks_through_offers).uniq.sort_by{ |e| e[:begin_time] }
  #   end

  #   def upcoming_walks_through_offers
  #     Walk.upcoming.includes(:offers).where(offers: { user: self })
  #   end
end