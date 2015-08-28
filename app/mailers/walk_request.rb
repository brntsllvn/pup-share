class WalkRequest < ApplicationMailer
  # for UX testing. *** TODO: REMOVE IN PRODUCTION***  
  default bcc: 'brntsllvn@gmail.com' 

  def walk_request(request)
    @requested_by = request.user
    @requested_of = request.requested_of_user
    @request      = request # need this in the mailer views

    headers['X-SMTPAPI'] = '{"filters":{"subscriptiontrack":{"settings":{"enable":1,"text/html":"Unsubscribe <%Here%>","text/plain":"Unsubscribe Here: <% %>"}}}}'

    mail( to: @requested_of.email, 
      subject: 'PupShare: Please approve or deny a walk request' )
  end

  def walk_request_approved(request)
    @requested_by = request.user	
    @requested_of = request.requested_of_user   		
    @request      = request # need this in the mailer views

    headers['X-SMTPAPI'] = '{"filters":{"subscriptiontrack":{"settings":{"enable":1,"text/html":"Unsubscribe <%Here%>","text/plain":"Unsubscribe Here: <% %>"}}}}'

    mail( to: @requested_by.email,
      subject: 'PupShare: Yay! Your walk request was approved' )
  end

  def walk_request_denied(request)
    @requested_by = request.user	
    @requested_of = request.requested_of_user   		
    @request      = request # need this in the mailer views

    headers['X-SMTPAPI'] = '{"filters":{"subscriptiontrack":{"settings":{"enable":1,"text/html":"Unsubscribe <%Here%>","text/plain":"Unsubscribe Here: <% %>"}}}}'

    mail( to: @requested_by.email, 
      subject: 'PupShare: Sorry. Your walk request was denied' )
  end

  def walk_request_cancel(request)
    @requested_by = request.user	
    @requested_of = request.requested_of_user   		
    @request      = request # need this in the mailer views

    headers['X-SMTPAPI'] = '{"filters":{"subscriptiontrack":{"settings":{"enable":1,"text/html":"Unsubscribe <%Here%>","text/plain":"Unsubscribe Here: <% %>"}}}}'

    mail( to: [@requested_by.email, @requested_of.email],
      subject: 'PupShare: Request cancelled notification' )
  end

  #   def walk_request_follow_up(request)
  #     @requested_by = request.user
  #     @requested_of = request.requested_of_user
  #     @request      = request # need this in the mailer views
  #     mail( to: @requested_of.email, 
  #       subject: 'PupShare: How did the walk go?' )
  #   end

end
