def display_scores()
  puts
  unless is_alive?
    puts "Game Over" 
    if @score1 > @score2
      puts "Player 1 Wins!"
    elsif @score1 < @score2
      puts "Player 2 Wins!"
    else
      puts "Tie!"
    end
    puts
  end
  puts "Player 1 score: #{@score1}  Player 1 lives: #{@lives1}"
  puts "Player 2 score: #{@score2}  Player 2 lives: #{@lives2}"
  puts
end

def generate_question()
  num1 = Random.rand(20) + 1
  num2 = Random.rand(20) + 1
  return num1, num2
end

def prompt_player_for_answer(player, num1, num2)
  puts "#{player}: What does #{num1} plus #{num2} equal?"
  gets.chomp.to_i
end

def correct_answer?(player_answer, num1, num2)
  player_answer == num1 + num2
end

def is_alive?()
  @lives1 != 0 && @lives2 != 0
end