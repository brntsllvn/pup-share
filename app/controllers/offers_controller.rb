class OffersController < ApplicationController
  before_action :authenticate_user!, except: [:edit]

  def index
    @walks  = current_user.walks
    @offers = current_user.offers
  end

  def show; end

  def new
    @offer = Offer.new
  end

  def create
    @offer = current_user.offers.create(offer_params)
    @offer.walk_request
    redirect_to :back, notice: 'Offer to walk sent to the owner'
  end

  def edit
    @offer = Offer.find(params[:id])
    redirect_to jobs_path, notice: @offer.send_request_mailers(params[:status]) 
  rescue ActiveRecord::RecordNotFound
    redirect_to jobs_path, alert: 'Walk no longer exists'   
  end

  def update; end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy if @offer.user == current_user
    redirect_to :back, alert: 'Walk cancelled'
  rescue ActiveRecord::RecordNotFound
    redirect_to :back, alert: 'Walk no longer exists' 
  end

  private

  def offer_params
    params.require(:offer).permit!
  end
end
