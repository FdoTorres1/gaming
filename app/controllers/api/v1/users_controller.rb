class Api::V1::UsersController < ApplicationController
  def create
    if User.exists?(username: user_params[:username])
      render json: { status: 'Error', message: "Username already in use" }, status: 400
    else
      user = User.new(username: user_params[:username], password: user_params[:password],
        name: user_params[:name], lastName: user_params[:lastName], email: user_params[:email])
      if user.save
        user.create_wallet
        render json: {username: user.username, id: user.id, money: user.wallet.coins, games: []}, status: 201
      else
        render json: { message: 'Unable to create user' }, status: 400
      end
    end
  end

  def login
    if User.exists?(username: user_params[:username])
      @user = User.find_by_username(user_params[:username])
      if @user.authenticate(params[:password])
        render json: {username: @user.username, id: @user.id, money: @user.wallet.coins, games: @user.get_games_list()}, status: 200
      else
        render json: { message: 'Incorrect password' }, status: 400
      end
    else
      render json: { message: 'User does not exist' }, status: 400
    end
  end

  def index
    @users = User.all
    render json: @users.to_json(:except => :"password_digest")
  end

  def show
    if User.exists?(id: params[:id])
      @user = User.find(params[:id])
      render json: @user.attributes.except("password").merge({games: @user.games.count(), matches: @user.matches.count(), coins: @user.wallet.coins}) 
    else
      render json: { message: 'User does not exist' }, status: 400
    end
  end

  private

  def user_params
    params.permit(:username, :password, :email, :name, :lastName)
  end
end
  
