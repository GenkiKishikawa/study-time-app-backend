class Api::V1::MonthlyTimeController < ApplicationController
  before_action :authenticate_api_v1_user! 

  def index
    @monthly_time = Record.where(user_id: current_api_v1_user.id, start_month: params[:month]).sum(:study_time)
    render json: @monthly_time
  end
  private

  def monthly_time_params
    params.require(:monthly_time).permit(:study_time)
  end
end