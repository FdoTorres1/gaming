class Api::V1::AchievementsController < ApplicationController
  def create
    achievement = Achievement.new(match_id: achievement_params[:match_id], 
    description: achievement_params[:description], bonus_coins: achievement_params[:bonus_coins], 
    level: achievement_params[:level])
    if achievement.save
      render json: achievement, status: 201
    else
      render json: { message: 'Unable to create achievement' }, status: 400
    end
  end

  def index
    @achievements = Achievement.all
    render json: @achievements
  end

  def add_achivement
    if User.exists?(id: params[:userId]) && Achievement.exists?(id: params[:id])
      @user = User.find(params[:userId])
      @achievement = Achievement.find(params[:id])
      if !@user.achievements.include?(@achievement)
        if @achievement.match.score >= @achievement.level
          @user.achievements << @achievement
          @user.wallet.coins += @achievement.bonus_coins
          @user.wallet.save
          render json: @user.achievements
        else
          render json: { message: 'User does not have enough score to get the achievement' }, status: 400
        end
      else
        render json: { message: 'User already owns achievement' }, status: 400
      end
    else
      render json: { message: 'User or Achivement do not exist' }, status: 400
    end
  end

  def remove_achievement
    if User.exists?(id: params[:userId]) && Achievement.exists?(id: params[:id])
      @user = User.find(params[:userId])
      @achievement = Achievement.find(params[:id])
      if !@user.achievements.include?(@achievement)
        render json: { message: 'Achievement not owned by user' }, status: 400
      else
        @user.achievements.delete(@achievement)
        render json: @user.achievements
      end
    else
      render json: { message: 'User or Achievements do not exist' }, status: 400
    end
  end

  def user_achievements
    if User.exists?(id: params[:userId])
      @user = User.find(params[:userId])
      render json: @user.achievements
    else
      render json: { message: 'User does not exist' }, status: 400
    end
  end

  def show
    if Achievement.exists?(id: params[:id])
      @achievement = Achievement.find(params[:id])
      render json: @achievement
    else
      render json: { message: 'Achievement does not exist' }, status: 400
    end
  end

  private
  def achievement_params
    params.permit(:match_id, :description, :bonus_coins, :level)
  end

end
