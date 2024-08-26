class Api::V1::MonthlyTimesController < ApplicationController
  before_action :authenticate_api_v1_user! 

  def index
    start_of_month = Date.new(params[:year].to_i, params[:month].to_i, 1)
    end_of_month = start_of_month.end_of_month
    @monthly_time = Record.where(user_id: current_api_v1_user.id).where(start_datetime: start_of_month..end_of_month).sum(:study_minutes)
    render json: @monthly_time
  end
  private

  def monthly_time_params
    params.require(:monthly_time).permit(:monthly_time)
  end
end