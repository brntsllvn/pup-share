class VisitorMessageController < ApplicationController

  def new
    @visitor_message = VisitorMessage.new
  end

  def create
    @visitor_message = VisitorMessage.new(visitor_message_params)
    if @visitor_message.save
      ContactMailer.contact_mailer(@visitor_message).deliver_now 
      redirect_to root_path, notice: 'Thanks for reaching out!'
    else
      render :new
    end
  end

  private

  def visitor_message_params
    params.require(:contact_form).permit!
  end
end
