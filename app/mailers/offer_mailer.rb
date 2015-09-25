class OfferMailer < ApplicationMailer

  def offer(offer)
    @walker = offer.walker
    @owner  = offer.owner
    @offer  = offer # need this in the mailer views

    headers['X-SMTPAPI'] = '{"filters":{"subscriptiontrack":{"settings":{"enable":1,"text/html":"Unsubscribe <%Here%>","text/plain":"Unsubscribe Here: <% %>"}}}}'

    mail( to: @owner.email, 
      subject: 'PupShare: Someone offered to walk your pup' )
  end
end
