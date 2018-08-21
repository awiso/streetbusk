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
      redirect_to artist_dashboard_path
    else
      render :new
    end
    authorize @performance
  end

  def index
    @performances = Performance.all
    policy_scope(Performance)
  end

  def show
    authorize @performance
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
end
