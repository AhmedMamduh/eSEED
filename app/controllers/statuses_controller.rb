class StatusesController < ApplicationController
  before_action :find_status, only: [:show, :edit, :update, :destroy]

  def index
     @statuses = Status.order("created_at DESC")
  end

  def show
  end

  def new
  	@status = Status.new
  end

  def create
  		@status = Status.new(status_params)

		if @status.save
			redirect_to @status, notice: "Status added successfully"
		else
			render "new"
		end
  end

  def edit
  end

  def update
  		if @status.update(status_params)
		redirect_to @status, notice: "Status updated successfully"
	 else
		render "edit"
	 end
  end

  def destroy
  		@status.destroy
		redirect_to root_path
  end

  private

  def find_status
  	@status = Status.find(params[:id])
  end

  def status_params
  	params.require(:status).permit(:present, :absent, :sick_leave, :day_off)
  end
end
