class WalksController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_walk, except: [:index, :new, :create]

  def index
    @walks = WalkSearch.new(Walk.all).search(search_params)
  end

  def new
    @walk = Walk.new
  end

  def edit # mailer links
  end

  def create
    @walk = current_user.walks_as_owner.new(walk_params)
    if @walk.save
      redirect_to user_upcoming_walks_path(current_user), notice: 'Walk created'
    else
      render :new
    end
  end

  def update
    if @walk.update(walk_params)
      redirect_to :back, notice: 'Walk updated'
    else
      redirect_to :back, notice: 'Something went wrong'
    end
  end

  def destroy
    @walk.destroy if @walk.owner == current_user
    redirect_to user_upcoming_walks_path(@walk.owner), notice: 'Walk destroyed'
  end

  private

  def set_walk
    @walk = Walk.find(params[:id])
  end

  def walk_params
    params.require(:walk).permit!
  end

  def search_params
    params.permit(
      :today, :this_week, :next_week, :walk_begin_time,
      :male, :female, :gender, 
      :xsml, :sml, :med, :lrg, :size,
      :mellow, :temperate, :energetic, :energy
      )
  end

end