require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users" do
    it "returns all users" do
      get "/api/v1/users"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /users" do
    it "creates a user" do
      post "/api/v1/users" , :params => { 
        :username => "testing",
        :password => "testing",
        :name => "testing",
        :lastName => "testing",
        :email => "testing@testing.com"
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:created)
    end
    it "does not create a user with taken username" do
      post "/api/v1/users" , :params => { 
        :username => "testing1",
        :password => "testing",
        :name => "testing",
        :lastName => "testing",
        :email => "testing1@testing.com"
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end

  describe "POST /users/login" do
    it "logs in a user" do
      post "/api/v1/users/login" , :params => { 
        :username => "testing1",
        :password => "testing1"
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
    it "does not log a user with incorrect password" do
      post "/api/v1/users" , :params => { 
        :username => "testing1",
        :password => "asdads",
        :name => "testing",
        :lastName => "testing",
        :email => "testing@testing.com"
      }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end

  describe "GET /users/id" do
    it "returns user info" do
      get "/api/v1/users/1"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:success)
    end
    it "does not return user info if user does not exist" do
      get "/api/v1/users/3"
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(400)
    end
  end
end
