class Walk < ActiveRecord::Base
  validates :begin_time,            presence: true,
  date: { after: Proc.new { Time.now }, message: 'Walk must be in the future' }
  validates :duration,              presence: true
  validates :phone_number_id,       presence: true
  validates :location_id,           presence: true
  validates :pup_id,                presence: true

  belongs_to :pup
  belongs_to :location
  belongs_to :phone_number
  belongs_to :owner, class_name: 'User'
  belongs_to :walker, class_name: 'User'
  has_many   :offers, dependent: :destroy

  scope :upcoming, -> { where('begin_time > ?' , Time.now) }
  scope :past,     -> { where('begin_time <= ?', Time.now) }

  def self.walks_through_offers(walker)
    includes(:offers).where(offers: { walker: walker })
  end

  # TODO: change 600000 to a reasonable number in prod
  def coming_up?
    return self.begin_time - Time.now < 600000.minutes
    false
  end

end