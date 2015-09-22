class WalksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_walk, except: [:index, :new, :create] 

  def index
    @walks = Walk.where("begin_time > ?", DateTime.now) # only show future walks
  end

  def show
  end

  def new
    @walk = Walk.new
  end

  def edit # mailer links 
  end

  def create
    @walk = current_user.walks.new(walk_params)
    @walk.update_attributes(end_time: @walk.begin_time + @walk.duration * 60)
    if @walk.save
      redirect_to user_requests_path(current_user), notice: 'Walk created. Monitor status in My Upcoming Walks'
    else
      render :new
    end
  end

  def update
    if @walk.update(walk_params)
      redirect_to user_requests_path(current_user), notice: 'Walk updated'
    else
      render :edit
    end
  end

  def destroy
    @walk.destroy
    redirect_to user_offers_path(current_user), notice: 'Walk destroyed'
  end

  private

  def set_walk
    @walk = Walk.find(params[:id])
  end

  def walk_params
    params.require(:walk).permit!
  end

end