class Api::V1::RecordsController < ApplicationController
  include Pagination

  before_action :set_record, only: [:update, :destroy]

  def index
    @records = Record.all.order(created_at: :desc).page(params[:page]).per(13)
    @pagination = resources_with_pagination(@records)

    response = {
      records: @records,
      pagination: @pagination
    }

    render json: response
  end

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

  def update
    if @record.update(record_params)
      render json: @record
    else
      render :edit
    end
  end

  def destroy
    @record.destroy
    render json: { message: 'Record deleted' }
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:study_time, :start_year, :start_month, :start_day, :start_time, :end_year, :end_month, :end_day, :end_time, :memo).merge(user_id: 1)
  end
end