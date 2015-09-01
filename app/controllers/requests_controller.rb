class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:edit]

  def index
    @jobs = current_user.jobs
    @requests = current_user.requests
  end

  def show; end

  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.create(request_params)
    @request.walk_request
    redirect_to :back, notice: "Offer to walk sent to the owner. You will receive an email with their response"
  end

  def edit
    @request = Request.find(params[:id])
    redirect_to jobs_path, notice: @request.send_request_mailers(params[:status]) 
  rescue ActiveRecord::RecordNotFound
    redirect_to jobs_path, alert: 'Sorry. The walk no longer exists'   
  end

  def update; end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to :back, alert: 'Walk cancelled'
  rescue ActiveRecord::RecordNotFound
    redirect_to :back, alert: 'Sorry. The walk no longer exists' 
  end

  private

  def request_params
    params.require(:request).permit!
  end
end
