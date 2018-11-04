class AttendancesController < ApplicationController
  before_action :find_attendance, only: [:show, :edit, :update, :destroy]

  def index
     @attendances = Attendance.order("created_at DESC")
  end

  def show
  end

  def new
  	@attendance = Attendance.new
  end

  def create
  		@attendance = Attendance.new(attendance_params)

		if @attendance.save
			redirect_to @attendance, notice: "Attendance added successfully"
		else
			render "new"
		end
  end

  def edit
  end

  def update
  		if @attendance.update(attendance_params)
		redirect_to @attendance, notice: "Attendance updated successfully"
	 else
		render "edit"
	 end
  end

  def destroy
  		@attendance.destroy
		redirect_to attendance_path
  end

  private

  def find_attendance
  	@attendance = Attendance.find(params[:id])
  end

  def attendance_params
  	params.require(:attendance).permit(:day, :working_hours, :employee_id, :status_id)
  end
end
