class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: :destroy

  def new
    @location = Location.new
  end

  def create
    @location = current_user.locations.new(location_params)
    if @location.save
      redirect_to new_walk_path(current_user), notice: 'You added a location. Use this form to post a walk'
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