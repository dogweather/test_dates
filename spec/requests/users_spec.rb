require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:users) { create_list(:user, 10) }
  let!(:valid_attributes) {
    build(:user).attributes
      .except("id", "created_at", "updated_at")
      .symbolize_keys
  }


  describe "POST /users" do
    context "when the request is valid" do
      before { post "/users", params: valid_attributes }

      it "creates a user" do
        expected_data = valid_attributes
        actual_data   = User.find(json['id'])

        binding.pry

        expect(actual_data).to have_attributes(expected_data)
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
  end


  describe "PUT /users/:id" do
    context "when the record exists" do
      before { put "/users/#{User.last.id}", params: valid_attributes }

      it "updates the record" do
        expect(response.body).to be_empty
        expect(User.last.attributes.except("id", "created_at", "updated_at")).to eq(valid_attributes.stringify_keys)
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

end
