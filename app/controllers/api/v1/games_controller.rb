class Api::V1::GamesController < ApplicationController 

  def index
    @games = Game.all
    render json: @games
  end

  def add_game
    if User.exists?(id: params[:userId]) && Game.exists?(id: params[:id])
      @user = User.find(params[:userId])
      @game = Game.find(params[:id])
      if !@user.games.include?(@game)
        if @user.wallet.coins >= @game.price
          @user.games << @game
          @user.wallet.coins -= @game.price
          @user.wallet.save
          render json: @user.games
        else
          render json: { message: 'User does not have enough coins' }, status: 400
        end
      else
        render json: { message: 'User already owns game' }, status: 400
      end
    else
      render json: { message: 'User or Game do not exist' }, status: 400
    end
  end

  def remove_game
    if User.exists?(id: params[:userId]) && Game.exists?(id: params[:id])
      @user = User.find(params[:userId])
      @game = Game.find(params[:id])
      if !@user.games.include?(@game)
        render json: { message: 'Game not owned by user' }, status: 400
      else
        @user.games.delete(@game)
        render json: @user.games
      end
    else
      render json: { message: 'User or Game do not exist' }, status: 400
    end
  end

  def user_games
    if User.exists?(id: params[:userId])
      @user = User.find(params[:userId])
      render json: @user.games
    else
      render json: { message: 'User does not exist' }, status: 400
    end
  end

  def show
    if Game.exists?(id: params[:id])
      @game = Game.find(params[:id])
      render json: @game
    else
      render json: { message: 'Game does not exist' }, status: 400
    end
  end

  def high_score
    if Game.exists?(id: params[:id])
      @game = Game.find(params[:id])
      render json: {matches: @game.getHighScore()}
    end
  end

end
