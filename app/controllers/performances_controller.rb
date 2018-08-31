class PerformancesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_performance, except: [ :index, :new, :create ]

  def new
    @performance = Performance.new
    authorize @performance
  end

  def create
    @performance = Performance.new(performance_params)
    @performance.user = current_user
    if @performance.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
    authorize @performance
  end

  def index
    @performances = policy_scope(Performance)

    policy_scope(Performance)
    if params[:query].present?
      sql_query = "location ILIKE :query"
      @performances = Performance.where(sql_query, query: "%#{params[:query]}%")
    else
      @performances = Performance.all.where.not('performances.location' => nil)
    end

    @markers = @performances.map.with_index do |performance, index|
      {
        lat: performance.latitude,
        lng: performance.longitude,
        performance: performance,
        index: index
      }
    end
  end

  def show
    @attendances = @performance.attendances.order(:id).limit(6);
    # @attendance_numbers = @performance.attendances.count
    @attendance = Attendance.new
    authorize @performance
    @contribution = Contribution.new
    @markers = [{
        lat: @performance.latitude,
        lng: @performance.longitude
          }]
    @duration = duration(@performance)
    @playing_now = playing_now?
    @comment = Comment.new(performance: @performance)
    @comments = @performance.comments.order(id: :desc).limit(5)
  end

  def edit
    authorize @performance
  end

  def update
    authorize @performance
  end

  def destroy
    authorize @performance
  end

  private

  def set_performance
    @performance = Performance.find(params[:id])
  end

  def performance_params
    params.require(:performance).permit(:location, :start_time, :end_time, :description, :photo, :genre_id)
  end

  def duration(performance)
    sec_in_hours = 60 * 60
    minutes = ((@performance.end_time - @performance.start_time)/60).to_i
    hours = ((@performance.end_time - @performance.start_time)/sec_in_hours).floor
    "#{hours > 0 ? "#{hours} hours" : ""}#{minutes > 0 ? " #{minutes} minutes." : ""}"
  end

  def playing_now?
    if DateTime.now > @performance.start_time && DateTime.now < @performance.end_time
      true
    else
      false
    end
  end
end
