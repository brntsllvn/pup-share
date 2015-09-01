class Job < ActiveRecord::Base
  validates :drop_off_time,            presence: true,
  date: { after: Proc.new { Time.now }, message: 'New walk must be in the future' }
  validates :drop_off_location,        presence: true
  validates :walk_duration,            presence: true
  validates :pick_up_location,         presence: true
  validates :pup_id,                   presence: true

  belongs_to :user
  belongs_to :pup
  has_many   :requests, dependent: :destroy
end