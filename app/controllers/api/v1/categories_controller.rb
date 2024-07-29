class Api::V1::CategoriesController < ApplicationController
  include Pagination

  before_action :authenticate_api_v1_user!
  before_action :set_category, only: [:update, :destroy]

  def index
    @categories = Category.where(user_id: current_api_v1_user.id).order(created_at: :desc).page(params[:page]).per(13)
    @pagination = resources_with_pagination(@categories)

    response = {
      categories: @categories,
      pagination: @pagination
    }

    render json: response
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    render json: { message: 'Category deleted' }
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :color).merge(user_id: current_api_v1_user.id)
  end
end
