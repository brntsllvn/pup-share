class Walk < ActiveRecord::Base
  validates :begin_time,            presence: true,
  date: { after: Proc.new { Time.now }, message: 'Walk must be in the future' }
  validates :begin_location,        presence: true
  validates :duration,              presence: true
  validates :end_location,          presence: true
  validates :pup_id,                presence: true

  belongs_to :user
  belongs_to :pup
  belongs_to :walker, class_name: 'User'
  has_many   :offers, dependent: :destroy
end