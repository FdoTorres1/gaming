require 'rails_helper'

RSpec.describe "Wallets", type: :request do

  describe "GET /wallets/:userId" do
    it "returns coins of a user" do
      get "/api/v1/wallets/1"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /add_coins" do
    it "add coins to user wallet" do
      post "/api/v1/wallets/2/charge", :params => { 
        :coins => 5
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['coins']).to eq(5)
    end
  end

  describe "POST /remove_coins" do
    it "remove coins to user wallet" do
      post "/api/v1/wallets/1/remove", :params => { 
        :coins => 5
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['coins']).to eq(195)
    end
  end
end
