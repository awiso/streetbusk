class AttendanceController < ApplicationController
  def create
    @performance = Performance.find(params_attendance[:performance_id])
    @attendance = Attendance.new(params_attendance)
    @attendance.user = current_user
    @attendance.save
    @user_detail = @attendance.user.email
    #if @attendance.save
      respond_to do |format|
        format.html { redirect_to performance_path(@performance) }
        format.js
      end
      authorize @attendance
  #  else
  #    flash[:alert] = "You're already attending this event"
  #    redirect_to performance_path(@performance)
  #  end
  end

  private

  def params_attendance
    params.require(:attendance).permit(:performance_id)
  end
end
