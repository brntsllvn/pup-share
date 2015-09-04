class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_job, except: [:index, :new, :create] 

  def index
    @jobs = Job.where(drop_off_time: DateTime.now..DateTime.now + 100.years) # only show future jobs
  end

  def show; end

  def new
    if current_user.pups.empty?
      redirect_to new_user_pup_path(current_user), alert: 'Create a pup to add to your job'
    else
      @job = Job.new
    end
  end

  def edit # facilitates mailer links
    redirect_to job_path, notice: 'To do...maybe put some stuff here...?' 
  end

  def create
    @job = current_user.jobs.new(job_params)
    @job.update_attributes(pick_up_time: @job.drop_off_time + @job.walk_duration * 60)
    if @job.save
      redirect_to root_path, notice: 'Job created. You can monitor its status in your My Upcoming Walks'
    else
      render :new
    end
  end

  def update
    binding.pry
    if @job.update(job_params)
      redirect_to :back, notice: 'Job updated'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to :back, notice: 'Job destroyed'
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit!
  end

end