Rails.application.routes.draw do
  resources :achievements
  root to: "static#home"
  namespace 'api' do
    namespace 'v1' do
      resources :matches
      get '/matches/ranking', to: 'matches#show'
      resources :users
      post '/users/login', to: 'users#login'
      resources :games
      get '/games/user/:userId', to: 'games#user_games'
      get '/games/:id/best', to: "games#high_score"
      post '/games/:id/user/:userId', to: 'games#add_game'
      post '/games/:id/user/:userId/remove', to: 'games#remove_game'
      resources :wallets
      get '/wallets/:userId', to: 'wallets#show'
      post '/wallets/:userId/charge', to: 'wallets#add_coins'
      post '/wallets/:userId/remove', to: 'wallets#remove_coins'
      get 'user/:id/matches', to: 'matches#index_user'
      get 'game/:id/matches', to: 'matches#index_game'
      resources :achievements
      get '/user/:userId/achievements', to: 'achievements#user_achievements'
      get '/game/:gameId/achievements', to: 'achievements#game_achievements'
      post '/user/:userId/achievements/:id', to: 'achievements#add_achivement'
      post '/user/:userId/remove/achievements/:id', to: 'achievements#remove_achievement'

    end
  end
end
