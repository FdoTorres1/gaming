@testing1 = User.create!(username: 'testing1', password: 'testing1', email: 'testing1@uc.cl', name: 'Fernando', lastName: 'Torres')
@testing2 = User.create!(username: 'testing2', password: 'testing2', email: 'testing2@uc.cl', name: 'Jorge', lastName: 'Mayol')

@testing1.create_wallet
@testing2.create_wallet
@testing2.add_coins(-200)
# @testing2.wallet.coins = 0
# @testing2.wallet.save

@game_test1 = Game.create(name: 'Space Hero', description: 'Can you beat the alien hordes? In Space Hero you are the ship commander in charge of destroying the enemies.', category: 'Endless Shooting', difficulty: 'Medium', price: 200)
@game_test2 = Game.create(name: 'JumpIng', description: 'JumpIng is a game where you have to last the longest jumping over incoming obstacles.', category: 'Endless Running', difficulty: 'Hard', price: 150)
@game_test3 = Game.create(name: 'Apple Race', description: 'In Apple Race your aim is key, move your basket to catch the falling apples.', category: 'Catch', difficulty: 'Easy', price: 100)

@testing1.games << @game_test1

@match_test1 = Match.create(user_id: 1, game_id: 1, game_time: 10, score: 20, coins_won: 10, status: 'good')
@match_test2 = Match.create(user_id: 1, game_id: 1, game_time: 15, score: 9, coins_won: 6, status: 'good')

@achievement_test1 = Achievement.create(match_id: 1, description: 'achievement for getting more than 20 points', bonus_coins: 20, level: 20)
@achievement_test2 = Achievement.create(match_id: 1, description: 'achievement for getting more than 10 points', bonus_coins: 10, level: 10)
@achievement_test3 = Achievement.create(match_id: 1, description: 'achievement for getting more than 80 points', bonus_coins: 80, level: 80)

@testing1.achievements << @achievement_test1