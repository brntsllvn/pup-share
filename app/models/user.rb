class User < ActiveRecord::Base
  serialize :auth_hash, Hash

  has_many :walks, dependent: :destroy
  #     has_many :walking_walks, class_name: Walk, as: "walker", dependent: :destroy
  #     has_many :owning_walks, class_name: Walk, as: "owner", dependent: :destroy 
  has_many :pups, dependent: :destroy
  has_many :offers, dependent: :destroy

  # Passes hash to built-in Rails method; no need to test
  def self.find_or_create_by_hash(auth) 
    user = User.find_or_initialize_by(provider: auth[:provider], uid: auth[:uid])

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

  def the_crux_of_past_and_future
    Time.now
  end

  def upcoming_walks
    self.walks.where('begin_time > ?', the_crux_of_past_and_future) 
  end

  def upcoming_walks_through_offers
    Walk.includes(:offers).where(offers: { user: self }).where('begin_time > ?', the_crux_of_past_and_future)
  end

  def upcoming_walks_and_offers
    (self.upcoming_walks + self.upcoming_walks_through_offers).uniq.sort_by{ |e| e[:begin_time] }
  end

  def past_walks
    self.walks.where('begin_time <= ?', the_crux_of_past_and_future) 
  end

  def past_walks_through_offers
    Walk.includes(:offers).where(offers: { user: self }).where('begin_time <= ?', the_crux_of_past_and_future)
  end

  def past_walks_and_offers
    (self.past_walks + self.past_walks_through_offers).uniq.sort_by{ |e| e[:begin_time] }
  end

end