require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let!(:user) { create(:user) }
  let!(:category) { create(:category, user_id: user.id) }
  let!(:headers) { user.create_new_auth_token }

  # GET /api/v1/categories
  describe "GET /api/v1/categories" do
    it "get the categories" do
      get api_v1_categories_path, headers: headers

      expect(response).to have_http_status(200)
    end
  end

  # GET /api/v1/categories/:id
  describe "GET /api/v1/categories/:id" do
    it "get the category" do
      get api_v1_category_path(category.id), headers: headers

      expect(response).to have_http_status(200)
    end
  end

  # POST /api/v1/categories
  describe "POST /api/v1/categories" do
    it "creates the category" do
      category_attributes = attributes_for(:category, user_id: user.id)

      post api_v1_categories_path, params: { category: category_attributes }, headers: headers

      expect(response).to have_http_status(201)
      expect(Category.last.user_id).to eq(user.id)
    end
  end

  # PUT /api/v1/categories/:id
  describe "PUT /api/v1/categories/:id" do
    let(:valid_attributes) { { name: "Updated Name" } }

    it "updates the category" do
      put api_v1_category_path(category.id), params: { category: valid_attributes }, headers: headers

      expect(response).to have_http_status(200)
      expect(Category.first.reload.name).to eq("Updated Name")
    end
  end

  # DELETE /api/v1/categories/:id
  describe "DELETE /api/v1/categories/:id" do
    it "deletes the category" do
      delete api_v1_category_path(category.id), headers: headers

      expect(response).to have_http_status(200)
      expect(Category.find_by(id: category.id)).to be_nil
    end
  end
end