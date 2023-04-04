class Api::V1::WalletsController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: {coins: @user.wallet.coins}
  end

  def add_coins
    @user = User.find(params[:userId])
    @user.wallet.coins += params[:coins].to_i
    @user.wallet.save
    render json: {coins: @user.wallet.coins}
  end

  def remove_coins
    @user = User.find(params[:userId])
    @user.wallet.coins -= params[:coins].to_i
    @user.wallet.save
    render json: {coins: @user.wallet.coins}
  end
end
