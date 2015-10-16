class PhoneNumbersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_phone_number, only: :destroy

  def new
    @phone_number = PhoneNumber.new
  end

  def create
    @phone_number = current_user.phone_numbers.new(phone_number_params)
    if @phone_number.save
      redirect_to new_walk_path(current_user), notice: 'You added a phone number. Use this form to post a walk'
    else
      render :new
    end
  end

  def destroy
    @phone_number.destroy if @phone_number.owner == current_user
    redirect_to user_path(current_user), notice: 'Phone number destroyed'
  end

  private

  def set_phone_number
    @phone_number = PhoneNumber.find(params[:id])
  end

  def phone_number_params
    params.require(:phone_number).permit!
  end

end