class Walk < ActiveRecord::Base
  validates :begin_time,            presence: true,
  date: { after: Proc.new { Time.now }, message: 'Walk must be in the future' }
  validates :duration,              presence: true
  validates :pup_id,                presence: true
  validates :street,                presence: true
  validates :city,                  presence: true
  validates :state,                 presence: true
  validates :zip,                   presence: true

  belongs_to :pup
#   belongs_to :user
  belongs_to :owner, class_name: 'User'
  belongs_to :walker, class_name: 'User'
  has_many   :offers, dependent: :destroy

  scope :for_user, ->(user) { where('owner_id = ? or walker_id = ?', user, user) }

  # TODO: change 600000 to a reasonable number in prod
  def coming_up?
    return self.begin_time - Time.now < 600000.minutes
    false
  end

  def past
    where('begin_time <= ?', Time.now)
  end

  def upcoming
    where('begin_time > ?', Time.now)
  end
end