class ContactMailer < ApplicationMailer

  def contact_mailer(contact)
    @contact = contact
    mail( to: 'brntsllvn@gmail.com', 
      subject: 'PupShare: Comment, Feature Request, Bug Report')
  end

end
