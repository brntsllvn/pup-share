class OfferNotifier < ApplicationMailer
  default from: 'any_from_address@example.com'

  def offer_notifier_email(offer)
    @user = offer.walk.owner
    mail( :to => @user.email,
      :subject => 'pupshare offer notifier' )
  end

end