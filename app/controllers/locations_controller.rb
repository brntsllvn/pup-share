class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: :destroy

  def new
    session[:prev_url] = request.referer
    @location = Location.new
  end

  def create
    @location = current_user.locations.new(location_params)
    if @location.save
      redirect_to session[:prev_url], notice: 'Location added'
    else
      render :new 
    end 
  end

  def destroy
    @location.destroy if @location.owner == current_user
    redirect_to user_path(current_user), notice: 'Location destroyed'
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit!
  end

end