class VisitorMessage < ActiveRecord::Base
  validates :message_type,      presence: true
  validates :message,           presence: true
  
  belongs_to :user
  
  def message_types
    ['Bug','Feature','Comment']
  end
  
end