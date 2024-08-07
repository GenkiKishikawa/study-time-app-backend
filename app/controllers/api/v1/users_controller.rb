class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!

  def upload_image
    user = current_api_v1_user
    if user.image.attach(params[:image])
      render json: { message: 'image uploaded successfully' }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    user = current_api_v1_user
    image_url = user.image.attached? ? url_for(user.image) : nil
  
    render json: { user: user.as_json, image_url: image_url }
  end

  private

  def user_params
    params.require(:user).permit(:image)
  end
end
