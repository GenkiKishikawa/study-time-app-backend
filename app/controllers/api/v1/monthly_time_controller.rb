class Api::V1::MonthlyTimeController < ApplicationController
  def index
    @monthly_time = Record.all.where(start_month: 1).sum(:study_time)
    render json: @monthly_time
  end
  private
end