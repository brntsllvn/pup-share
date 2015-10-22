class OffersController < ApplicationController
  before_action :authenticate_user!, except: :edit

  def new
    @offer = Offer.new
  end

  def create
    @offer = current_user.offers.create(offer_params)
    @offer.send_mailer # TODO: revisit
    redirect_to :back, notice: 'Offer to walk sent to the owner'
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy if @offer.walker == current_user
    redirect_to :back, alert: 'Offer Rescinded'
  rescue ActiveRecord::RecordNotFound
    redirect_to :back, alert: 'Walk no longer exists' 
  end

  private
    
  def offer_params
    params.require(:offer).permit!
  end
end
