@fossa = User.create!(username: 'fossa', password: 'fossa', email: 'fernando.torres@uc.cl', name: 'Fernando', lastName: 'Torres')
@jorge = User.create!(username: 'jorge', password: 'jorge', email: 'jorge.mayol@uc.cl', name: 'Jorge', lastName: 'Mayol')
@jack = User.create!(username: 'jack', password: 'jack', email: 'zyan@uc.cl', name: 'Ziqi', lastName: 'Yan')
@dani = User.create!(username: 'dani', password: 'dani', email: 'dani@uc.cl', name: 'Daniela', lastName: 'Poblete')

@fossa.create_wallet
@jorge.create_wallet
@jack.create_wallet
@dani.create_wallet

Game.create(name: 'Space Hero', description: 'Can you beat the alien hordes? In Space Hero you are the ship commander in charge of destroying the enemies.', category: 'Endless Shooting', difficulty: 'Medium', price: 200)
Game.create(name: 'JumpIng', description: 'JumpIng is a game where you have to last the longest jumping over incoming obstacles.', category: 'Endless Running', difficulty: 'Hard', price: 150)
Game.create(name: 'Apple Race', description: 'In Apple Race your aim is key, move your basket to catch the falling apples.', category: 'Catch', difficulty: 'Easy', price: 100)
