class Offer < ActiveRecord::Base

  belongs_to :user
  belongs_to :walker, class_name: 'User'
  belongs_to :walk

  def send_mailer
    OfferMailer.offer_mailer(self).deliver_now 
  end
end
