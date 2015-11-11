class PhoneNumbersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_phone_number, only: :destroy

  def new
    session[:prev_url] = request.referer
    @phone_number = PhoneNumber.new
  end

  def create
    @phone_number = current_user.phone_numbers.new(phone_number_params)
    if @phone_number.save
      redirect_to session[:prev_url], notice: 'Number added'
    else
      render :new
    end
  end

  def destroy
    @phone_number.destroy if @phone_number.owner == current_user
    redirect_to user_path(current_user), notice: 'Number destroyed'
  end

  private

  def set_phone_number
    @phone_number = PhoneNumber.find(params[:id])
  end

  def phone_number_params
    params.require(:phone_number).permit!
  end

end