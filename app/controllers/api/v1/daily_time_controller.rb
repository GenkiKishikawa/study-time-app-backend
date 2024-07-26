class Api::V1::DailyTimeController < ApplicationController
  before_action :authenticate_api_v1_user! 

  def index
    @daily_time = Record.where(user_id: current_api_v1_user.id, start_month: params[:month], start_day: params[:day]).sum(:study_time)
    render json: @daily_time
  end
  private

  def daily_time_params
    params.require(:daily_time).permit(:study_time)
  end
end