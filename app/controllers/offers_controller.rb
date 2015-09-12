class OffersController < ApplicationController
  before_action :authenticate_user!, except: [:edit]

  def index
    @walks             = current_user.jobs.where.not(walker_id: nil)
    @offers            = current_user.offers.where.not(status: 'pending') 
    @walks_no_walker   = current_user.jobs.where(walker_id: nil)
    @offers_pending    = current_user.requests.where(status: 'pending') 
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
    @offer.destroy
    redirect_to :back, alert: 'Walk cancelled'
  rescue ActiveRecord::RecordNotFound
    redirect_to :back, alert: 'Walk no longer exists' 
  end

  private

  def offer_params
    params.require(:offer).permit!
  end
end
