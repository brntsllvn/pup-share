class Offer < ActiveRecord::Base
  acts_as_paranoid # soft delete

  belongs_to :walker, class_name: 'User'
  belongs_to :walk

  def send_offer_notifier_email
    OfferNotifier.offer_notifier_email(self).deliver_now 
  end
  
end