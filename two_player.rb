require 'pry'
require 'colorize'
require './methods'
require './player'

class InvalidGuessError < StandardError;  end
class NoNameError < StandardError;  end


@score1 = 0
@score2 = 0

@lives1 = 3
@lives2 = 3


actual_name = false
until actual_name
  puts "Player 1: What is your name?"
  begin
    player1 = Player.create_player(gets.chomp)
    raise NoNameError, "Please enter a name." if (player1.player_name == "")
    puts
  rescue NoNameError => e
    puts e.message
  else actual_name = true
  end
end

actual_name = false
until actual_name
  puts "Player 2: What is your name?"
  begin
    player2 = Player.create_player(gets.chomp)
    raise NoNameError, "Please enter a name." if (player2.player_name == "")
    puts
  rescue StandardError
    puts "Please enter a name."
  else
    actual_name = true
  end
end

i = 0
while is_alive? player1, player2
  who_is_playing = (i % 2) + 1
  correct_answer, operator, num1, num2 = generate_question()
  player_answer = prompt_player_for_answer(who_is_playing, player1, player2, operator, num1, num2)
  give_feedback(who_is_playing, player_answer, correct_answer, player1, player2)
  i += 1

end

