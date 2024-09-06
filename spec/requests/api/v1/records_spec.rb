require 'rails_helper'

RSpec.describe "Records", type: :request do
  let!(:user) { create(:user) }
  let!(:category) { create(:category, user_id: user.id) }
  let!(:record) { create(:record, category_id: category.id, user_id: user.id) }
  let!(:headers) { user.create_new_auth_token }

  # GET /api/v1/records
  describe "GET /api/v1/records" do
    it "get the records" do
      get api_v1_records_path, headers: headers

      expect(response).to have_http_status(200)
    end
  end

  # GET /api/v1/records/:id
  describe "GET /api/v1/records/:id" do
    it "get the record" do
      get api_v1_records_path(record.id), headers: headers

      expect(response).to have_http_status(200)
    end
  end

  # POST /api/v1/records
  describe "POST /api/v1/records" do
    it "creates the record" do
      record_attributes = attributes_for(:record, user_id: user.id, category_id: category.id)
      
      post api_v1_records_path, params: { record: record_attributes }, headers: headers

      expect(response).to have_http_status(201)
      expect(Record.last.user_id).to eq(user.id)
    end
  end

  # PUT /api/v1/records/:id
  describe "PUT /api/v1/records/:id" do
    let(:valid_attributes) { { memo: "Updated Memo" } }

    it "updates the record" do
      put api_v1_record_path(record.id), params: { record: valid_attributes }, headers: headers

      expect(response).to have_http_status(200)
      expect(Record.first.reload.memo).to eq("Updated Memo")
    end
  end

  # DELETE /api/v1/records/:id
  describe "DELETE /api/v1/records/:id" do
    it "deletes the record" do
      delete api_v1_record_path(record.id), headers: headers

      expect(response).to have_http_status(200)
      expect(Record.find_by(id: record.id)).to be_nil
    end
  end
end