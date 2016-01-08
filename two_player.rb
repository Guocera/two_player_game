require 'pry'
require 'colorize'
require './methods'
require './player'

@score1 = 0
@score2 = 0

@lives1 = 3
@lives2 = 3

i = 0
puts "Player 1: What is your name?"
player1 = Player.create_player(gets.chomp)
puts
puts "Player 2: What is your name?"
player2 = Player.create_player(gets.chomp)
puts

while is_alive? player1, player2
  who_is_playing = (i % 2) + 1
  correct_answer, operator, num1, num2 = generate_question()
  player_answer = prompt_player_for_answer(who_is_playing, player1, player2, operator, num1, num2)
  give_feedback(who_is_playing, player_answer, correct_answer, player1, player2)
  i += 1
end

