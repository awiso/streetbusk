class AttendanceController < ApplicationController
  def create
    @user = User.find params[:user_id]
    @attendance = Attendance.new
    raise
  end

  private

  def params_attendance
    params.require(:attendance).permit(:performance_id)
  end
end
