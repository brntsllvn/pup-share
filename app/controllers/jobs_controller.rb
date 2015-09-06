class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_job, except: [:index, :new, :create] 

  def index
    # only show future jobs
    @jobs = Job.where(drop_off_time: DateTime.now..DateTime.now + 100.years)
  end

  def show; end

  def new
    if current_user.pups.empty?
      redirect_to new_user_pup_path(current_user), alert: 'Create a pup to add to your job'
    else
      @job = Job.new
    end
  end

  def edit # mailer links 
  end

  def create
    @job = current_user.jobs.new(job_params)
    @job.update_attributes(pick_up_time: @job.drop_off_time + @job.walk_duration * 60)
    if @job.save
      redirect_to user_requests_path(current_user), notice: 'Walk created. You can monitor its status in My Upcoming Walks'
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      # if !params[:job][:walker_id].nil?
      redirect_to user_requests_path(current_user), notice: 'Job updated'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to user_requests_path(current_user), notice: 'Job destroyed'
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit!
  end

end