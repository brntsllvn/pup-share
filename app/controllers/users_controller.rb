class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:upcoming_walks, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @pups = @user.pups unless @user.pups.nil?
  end

  def upcoming_walks
    @walks_plus_offers = current_user.upcoming_walks_and_offers
  end

  def past_walks
    @walks_plus_offers = current_user.past_walks_and_offers
  end

  def new; end

  def edit; end

  def create
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