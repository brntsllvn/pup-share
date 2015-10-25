class Offer < ActiveRecord::Base
  acts_as_paranoid # soft delete

  belongs_to :walker, class_name: 'User'
  belongs_to :walk

  def send_mailer
    OfferMailer.offer_mailer(self).deliver_now 
  end
end
