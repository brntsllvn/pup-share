class PupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pup, only: [:show, :edit, :update, :destroy]

  def index
    @pups = current_user.pups
  end

  def show; end

  def new
    @pup = Pup.new
  end

  def edit; end

  def create
    @pup = current_user.pups.new(pup_params)
    if @pup.save
      redirect_to new_walk_path(current_user), notice: "You created a pup. Use this form to post a walk your co-workers can view."
    else
      render :new 
    end
  end

  def update
    if @pup.update(pup_params) && @pup.owner == current_user
      redirect_to user_path(current_user), notice: 'Pupdated'
    else
      render :edit
    end
  end

  def destroy
    @pup.destroy if @pup.user == current_user
    redirect_to user_path(current_user), notice: 'Pup destroyed'
  end

  private

  def set_pup
    @pup = Pup.find(params[:id])
  end

  def pup_params
    params.require(:pup).permit!
  end

end
