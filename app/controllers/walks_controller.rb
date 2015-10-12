class WalksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_walk, except: [:index, :new, :create]

  def index
    @walks = Walk.all
    # @walks = Walk.upcoming
  end

  def show; end

  def new
    if current_user.pups.empty?
      redirect_to new_user_pup_path(current_user), notice: 'Add a pup first'
    else
      @walk = Walk.new
    end
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
    @walk.destroy
    redirect_to user_upcoming_walks_path(@walk.owner), notice: 'Walk destroyed'
  end

  private

  def set_walk
    @walk = Walk.find(params[:id])
  end

  def walk_params
    params.require(:walk).permit!
  end

end