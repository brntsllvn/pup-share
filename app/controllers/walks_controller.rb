class WalksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_walk, except: [:index, :new, :create] 

  def index
    # only show future walks
    @walks = Walk.where("begin_time > ?", DateTime.now) 
  end

  def show; end

  def new
    if current_user.pups.empty?
      redirect_to new_user_pup_path(current_user), alert: 'Create a pup to add to your walk'
    else
      @walk = Walk.new
    end
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