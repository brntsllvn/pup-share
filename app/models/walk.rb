class Walk < ActiveRecord::Base
  acts_as_paranoid # soft delete

  validates :begin_time,            presence: true,
  date: { after: Proc.new { Time.now }, message: 'Walk must be in the future' }
  validates :duration,              presence: true
  validates :phone_number_id,       presence: true
  validates :location_id,           presence: true
  validates :pup_id,                presence: true

  belongs_to :pup
  belongs_to :location
  belongs_to :phone_number # TODO: not logical... should be owner or walker phone
  belongs_to :owner, class_name: 'User'
  has_many   :offers, dependent: :destroy

  has_one :winning_offer, -> { where winner: true }, class_name: 'Offer'
  has_one :walker, through: :winning_offer

  scope :upcoming, -> { where('begin_time > ?' , Time.now) }
  scope :past,     -> { where('begin_time <= ? OR ended_by_walker = ?', Time.now, true) }
  scope :next_week, -> { where('begin_time <= ?' , Time.now + 7.days) }

  def self.walks_through_offers(walker)
    includes(:offers).where(offers: { walker: walker })
  end

  def coming_up?
    return self.begin_time - Time.now < 15.minutes
    false
  end

end