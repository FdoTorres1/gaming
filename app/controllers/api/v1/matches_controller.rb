class Api::V1::MatchesController < ApplicationController
  def create
    game = Game.find(match_params[:game_id])
    user = User.find(match_params[:user_id])
    match = Match.new(user_id: match_params[:user_id], game_id: match_params[:game_id], 
      game_time: match_params[:game_time], score: match_params[:score], 
      coins_won: match_params[:coins_won], status: match_params[:status], gameName: game.name,
      userName: user.username)
    if match.save
      user.add_coins(match_params[:coins_won])
      render json: match, status: 201
    else
      render json: { message: 'Unable to create match' }, status: 400
    end
  end

  def index_user
    if User.exists?(id: params[:id])
      user = User.find(params[:id])
      if user.matches[0]
        @matches = user.matches
        render json: {matches: @matches.last(6).reverse()}, status: 200
      else
        render json: {matches: []}, status: 201
      end
    else
      render json: { message: 'User does not exist' }, status: 400
    end
  end

  def index_game
    if Game.exists?(id: params[:id])
      game = Game.find(params[:id])
      if game.matches[0]
        @matches = game.matches
        render json: {matches: @matches.last(6).reverse()}, status: 200
      else
        render json: {matches: []}, status: 201
      end
    else
      render json: { message: 'Game does not exist' }, status: 400
    end
  end

  def show
    if Game.exists?(name: params[:name])
      game = Game.find_by_name(params[:name])
      if game.matches[0]
        @matches = game.matches
        render json: @matches.sort_by(&:score).last(10).reverse(), status: 200
      else
        render json: { message: 'No matches for this game :(' }, status: 400
      end
    else
      render json: { message: 'The Game requested does not exist' }, status: 400
    end
  end

  private

  def match_params
    params.permit(:user_id, :game_id, :game_time, :score, :coins_won, :status)
  end

end
  
