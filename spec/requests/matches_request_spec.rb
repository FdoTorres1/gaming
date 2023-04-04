require 'rails_helper'

RSpec.describe "Matches", type: :request do

  describe "GET /matches_index_user" do
    it "returns the matches of a user" do
      get "/api/v1/user/1/matches"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
    end
    it "when the user has no matches" do
      get "/api/v1/user/2/matches"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(201)
    end
    it "does not return matches of a user if user does not exist" do
      get "/api/v1/user/3/matches"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end

  describe "GET /matches_index_game" do
    it "returns the matches of a game" do
      get "/api/v1/game/1/matches"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
    end
    it "when the game has no matches" do
      get "/api/v1/game/2/matches"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(201)
    end
    it "does not return matches of a game if game does not exist" do
      get "/api/v1/game/4/matches"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end
  
  describe "GET /matches_show" do
    it "returns the top 10 matches of a game" do
      get "/api/v1/matches/ranking", :params => { 
        :name => "Space Hero"
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
    it "does not return the top 10 matches of a game, if the game has not matches" do
      get "/api/v1/matches/ranking", :params => { 
        :name => "Apple Race"
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
    it "does not returns the top 10 matches of a game, if game does not exist" do
      get "/api/v1/matches/ranking", :params => { 
        :name => "Space"
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end
  describe "POST /matches" do
    it "creates a match" do
      post "/api/v1/matches", :params => { 
        :user_id => 1,
        :game_id => 1,
        :game_time => 21,
        :score => 14,
        :coins_won => 12,
        :status => "ok"
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:created)
    end
  end
end
