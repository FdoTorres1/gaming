require 'rails_helper'

RSpec.describe "Games", type: :request do

  describe "GET /games" do
    it "returns all games" do
      get "/api/v1/games"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /add_game" do
    it "add game to user" do
      post "/api/v1/games/2/user/1"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
    it "does not add a game to user because user does not have enough coins" do
      post "/api/v1/games/1/user/2"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not add a game to user because user already owns game" do
      post "/api/v1/games/1/user/1"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not add a game to user because game do not exist" do
      post "/api/v1/games/10/user/1"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not add a game to user because user do not exist" do
      post "/api/v1/games/1/user/10"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end

  describe "POST /remove_game" do
    it "remove game to user" do
      post "/api/v1/games/1/user/1/remove"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
    it "does not remove the game to user because game not owned by user" do
      post "/api/v1/games/3/user/1/remove"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not remove the game to user because game do not exist" do
      post "/api/v1/games/10/user/1/remove"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not remove the game to user because user do not exist" do
      post "/api/v1/games/1/user/10/remove"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end
  
  describe "GET user_games" do
    it "returns the games of a user" do
      get "/api/v1/games/user/1"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
    it "does not return games of a user if user does not exist" do
      get "/api/v1/games/user/3"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end

  describe "GET /games/id" do
    it "returns game info" do
      get "/api/v1/games/2"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
    it "does not return game info, if game does not exist" do
      get "/api/v1/games/4"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end

  describe "GET games_high_score" do
    it "returns game high_score" do
      get "/api/v1/games/1/best"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
  end
end
