def display_scores(player1, player2)
  unless is_alive? player1, player2
    puts "Game Over" 
    if player1.score > player2.score
      puts "#{player1.player_name} Wins!"
    elsif player1.score < player2.score
      puts "#{player2.player_name} Wins!"
    else
      puts "Tie!"
    end
    puts
  end
  puts "#{player1.player_name} score: #{player1.score}  #{player1.player_name} lives: #{player1.lives}"
  puts "#{player2.player_name} score: #{player2.score}  #{player2.player_name} lives: #{player2.lives}"
  puts
end

def generate_question()
  num1 = Random.rand(20) + 1
  num2 = Random.rand(20) + 1
  return num1, num2
end

def prompt_player_for_answer(player, player1, player2, num1, num2)
  if player == 1
    puts "#{player1.player_name}: What does #{num1} plus #{num2} equal?"
  else
    puts "#{player2.player_name}: What does #{num1} plus #{num2} equal?"
  end
  gets.chomp.to_i
end

def correct_answer?(player_answer, num1, num2)
  player_answer == num1 + num2
end

def is_alive?(player1,player2)
  player1.lives != 0 && player2.lives != 0
end




