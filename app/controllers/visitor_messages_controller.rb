class VisitorMessagesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @visitor_message = VisitorMessage.new
  end

  def create
    @visitor_message = current_user.visitor_messages.new(visitor_message_params)
    if @visitor_message.save
      VisitorMessageMailer.visitor_message_mailer(@visitor_message).deliver_now 
      redirect_to root_path, notice: 'Thanks for the message'
    else
      render :new
    end
  end

  private

  def visitor_message_params
    params.require(:visitor_message).permit!
  end
end
