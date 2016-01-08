require 'pry'
require 'colorize'
require './methods'
require './player'

@score1 = 0
@score2 = 0

@lives1 = 3
@lives2 = 3

i = 0


player1 = Player.create_player("Nick")
player2 = Player.create_player("Rachel")

while is_alive? player1, player2
  who_is_playing = (i % 2) + 1
  num1, num2 = generate_question()
  player_answer = prompt_player_for_answer(who_is_playing, player1, player2, num1, num2)
  if correct_answer? player_answer, num1, num2
    who_is_playing == 1 ? player1.gain_point : player2.gain_point
    puts "Correct!".green
    puts
  else
    who_is_playing == 1 ? player1.lose_life : player2.lose_life
    puts "Incorrect!".red
    puts
    display_scores(player1, player2)
  end
  i += 1
end

