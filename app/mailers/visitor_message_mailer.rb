class VisitorMessageMailer < ApplicationMailer

  def visitor_message_mailer(contact)
    @visitor_message = visitor_message
    mail( to: 'brntsllvn@gmail.com', 
      subject: 'PupShare: Comment, Feature Request, Bug Report')
  end
end