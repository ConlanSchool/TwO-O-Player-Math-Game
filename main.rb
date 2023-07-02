require_relative 'player'
require_relative 'question'
require_relative 'game'

player1 = Player.new("P1")
player2 = Player.new("P2")

game = Game.new(player1, player2)
game.start_game
