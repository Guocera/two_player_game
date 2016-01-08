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
  operator = [:+, :-, :*, :/].sample
  return [num1, num2].reduce(operator), operator, num1, num2
end

def prompt_player_for_answer(who_is_playing, player1, player2, operator, num1, num2)
  if who_is_playing == 1
    puts "#{player1.player_name}: What does #{num1} #{operator} #{num2} equal?"
  else
    puts "#{player2.player_name}: What does #{num1} #{operator} #{num2} equal?"
  end
  gets.chomp.to_i
end

def give_feedback(who_is_playing, player_answer, correct_answer, player1, player2)
  if player_answer == correct_answer
    who_is_playing == 1 ? player1.gain_point : player2.gain_point
    puts "Correct!".green
    puts
  else
    who_is_playing == 1 ? player1.lose_life : player2.lose_life
    puts "Incorrect!  The correct answer is #{correct_answer}.".red
    puts
    display_scores(player1, player2)
  end
end

def is_alive?(player1,player2)
  player1.lives != 0 && player2.lives != 0
end




