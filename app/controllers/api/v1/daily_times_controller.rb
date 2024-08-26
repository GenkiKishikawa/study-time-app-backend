class Api::V1::DailyTimesController < ApplicationController
  before_action :authenticate_api_v1_user! 

  def index
    start_of_date = Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    end_of_date = start_of_date.end_of_day
    @daily_time = Record.where(user_id: current_api_v1_user.id, start_datetime: start_of_date..end_of_date).sum(:study_minutes)
    render json: @daily_time
  end
  private

  def daily_time_params
    params.require(:daily_time).permit(:daily_time)
  end
end