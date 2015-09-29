class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @pups = @user.pups unless @user.pups.nil?
  end

  def upcoming_walks
    # TODO: order results once combined
    walks = current_user.walks
    offer_walks = []
    current_user.offers.each do |offer|
      offer_walks << offer.walk
    end
    @walks_plus_offers = (walks + offer_walks).uniq.sort_by{ |e| e[:begin_time] }
  end

  def new; end

  def edit; end

  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path(current_user), notice: 'User created'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params) && @user == current_user
      redirect_to @user, notice: 'User updated'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy if @user == current_user
    redirect_to root_path, notice: 'Account deleted'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end
end