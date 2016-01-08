require 'pry'
require './methods'

@score1 = 0
@score2 = 0

@lives1 = 3
@lives2 = 3

i = 0

while is_alive?
  player_number = (i % 2) + 1
  player_name = "Player #{player_number}"
  num1, num2 = generate_question()
  player_answer = prompt_player_for_answer(player_name, num1, num2)
  if correct_answer? player_answer, num1, num2
    case player_number
    when 1
      @score1 += 1
      puts "Correct!"
      puts
    when 2
      @score2 += 1
      puts "Correct!"
      puts
    end
  else
    case player_number
    when 1
      @lives1 -= 1
      puts "Incorrect!"
    when 2
      @lives2 -= 1
      puts "Incorrect!"
    end
    display_scores
  end
  i += 1
end

