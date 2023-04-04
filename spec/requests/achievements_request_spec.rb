require 'rails_helper'

RSpec.describe "Achievements", type: :request do

  describe "POST /achievements" do
    it "creates a match" do
      post "/api/v1/achievements", :params => { 
        :match_id => 2,
        :description => "achievement for getting more than 25 points",
        :bonus_coins => 25,
        :level => 25,
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET /achivements" do
    it "returns all achievements" do
      get "/api/v1/achievements"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /user_achievements" do
    it "returns the achievements of a user" do
      get "/api/v1/user/1/achievements"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
    end
    it "does not return achievements of a user if user does not exist" do
      get "/api/v1/user/3/achievements"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end

  describe "POST /add_achievements" do
    it "add achievement to user" do
      post "/api/v1/user/1/achievements/2"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
    it "does not add achievement to user because user does not have enough score to get the achievement" do
      post "/api/v1/user/1/achievements/3"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not add a achievement to user because user already owns achievement" do
      post "/api/v1/user/1/achievements/1"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not add a achievement to user because achievement do not exist" do
      post "/api/v1/user/1/achievements/4"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not add a achievement to user because user do not exist" do
      post "/api/v1/user/3/achievements/4"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end

  describe "POST /remove_achievement" do
    it "remove achievement to user" do
      post "/api/v1/user/1/remove/achievements/1"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
    it "does not remove the achievement to user because achievement not owned by user" do
      post "/api/v1/user/1/remove/achievements/3"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not remove the achievement to user because achievement do not exist" do
      post "/api/v1/user/1/remove/achievements/4"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not remove the achievement to user because achievement do not exist" do
      post "/api/v1/user/3/remove/achievements/1"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end
  
  describe "GET /achievements/id" do
    it "returns achievements info" do
      get "/api/v1/achievements/1"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
    it "does not return achievements info if achievements does not exist" do
      get "/api/v1/achievements/4"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end
end
