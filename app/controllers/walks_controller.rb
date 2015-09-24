class WalksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_walk, except: [:index, :new, :create] 

  def index
    @walks = Walk.where("begin_time > ?", DateTime.now) # show future walks
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
    @walk.update_attributes end_time: @walk.begin_time + @walk.duration * 60, 
    owner_id: @walk.user_id, # TODO: this is a hack, no need to store both user and owner
    end_location: @walk.begin_location # TODO: clumsy
    if @walk.save
      redirect_to user_offers_path(current_user), notice: 'Walk created'
    else
      render :new
    end
  end

  def update
    if @walk.update(walk_params)
      redirect_to user_offers_path(current_user), notice: 'Walk updated'
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