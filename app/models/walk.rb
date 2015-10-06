class Walk < ActiveRecord::Base
  validates :begin_time,            presence: true,
  date: { after: Proc.new { Time.now }, message: 'Walk must be in the future' }
  validates :begin_location,        presence: true
  validates :duration,              presence: true
  validates :end_location,          presence: true
  validates :pup_id,                presence: true

  belongs_to :pup
  belongs_to :user
  belongs_to :owner, class_name: 'User'
  belongs_to :walker, class_name: 'User'
  has_many   :offers, dependent: :destroy

  def coming_up?(minutes)
    return self.begin_time - Time.now < minutes.minutes
    false
  end
  
  def owner_signed_in?
    
  end
  
  def walker_signed_in?
    
  end
  
end