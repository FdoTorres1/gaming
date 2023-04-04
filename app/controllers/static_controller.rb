class StaticController < ApplicationController
  def home
    render json: { status: "GamIng API" }
  end
end