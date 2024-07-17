class Api::V1::RecordsController < ApplicationController

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    
    if @record.save
      render json: @record, status: :created
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  def index
    @records = Record.all
    render json: @records
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to @record
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    render json: { message: 'Record deleted' }
  end

  private

  def record_params
    params.require(:record).permit(:study_time, :start_year, :start_month, :start_day, :start_time, :end_year, :end_month, :end_day, :end_time).merge(user_id: 1)
  end
end