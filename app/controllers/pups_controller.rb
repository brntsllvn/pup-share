class PupsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_pup, only: [:show, :edit, :update, :destroy]

  def new
    session[:prev_url] = request.referer
    @pup = Pup.new
  end

  def edit; end

  def create
    @pup = current_user.pups.new(pup_params)
    if @pup.save
      redirect_to session[:prev_url], notice: 'Pup added'
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
    @pup.destroy if @pup.owner == current_user
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
