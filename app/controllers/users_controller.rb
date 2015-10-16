class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:upcoming_walks, :past_walks, :destroy]
  before_action :set_user, only: [:show, :destroy]

  def show # profile & pups
    @pups = @user.pups unless !@user.pups
    @phone_numbers = @user.phone_numbers unless !@user.phone_numbers
    @locations = @user.locations unless !@user.locations
  end

  def upcoming_walks
    @walks_plus_offers = current_user.upcoming_walks_and_offers.sort_by{ |e| e[:begin_time] }
  end

  def past_walks
    @walks_plus_offers = current_user.past_walks_and_offers.sort_by{ |e| e[:begin_time] }
  end

  def destroy
    @user.destroy if @user == current_user
    redirect_to root_path, notice: 'Account destroyed'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end
end