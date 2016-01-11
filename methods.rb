def display_scores(player1, player2)
  unless is_alive? player1, player2
    puts "Game Over" 
    if player1.score > player2.score
      puts "#{player1.player_name} Wins!\n "
    elsif player1.score < player2.score
      puts "#{player2.player_name} Wins!\n "
    else
      puts "Tie!"
    end
    puts "#{player1.player_name} score: #{player1.score}  #{player1.player_name} lives: #{player1.lives}"
    puts "#{player2.player_name} score: #{player2.score}  #{player2.player_name} lives: #{player2.lives}"
    valid_input = false
    until valid_input
      puts "\nDo you want to play again? 'Yes' or 'No' "
      play_again = gets.chomp.downcase
      if play_again == "yes"
        puts
        valid_input = true
        player1.restart
        player2.restart
      elsif play_again == "no"
        valid_input = true
        puts "\nThank you for playing!"
      else
        puts "\nPlease enter 'Yes' or 'No'."
      end
    end
  else
    puts "#{player1.player_name} score: #{player1.score}  #{player1.player_name} lives: #{player1.lives}"
    puts "#{player2.player_name} score: #{player2.score}  #{player2.player_name} lives: #{player2.lives}"
    puts
  end
end

def generate_question()
  num1 = Random.rand(20) + 1
  num2 = Random.rand(20) + 1
  operator = [:+, :-, :*, :/].sample
  return [num1.to_f, num2.to_f].reduce(operator).round(2), operator, num1, num2
end

def prompt_player_for_answer(who_is_playing, player1, player2, operator, num1, num2)
  proper_guess = false
  until proper_guess
    begin
      if who_is_playing == 1
        puts "#{player1.player_name}: What does #{num1} #{operator} #{num2} equal?"
      else
        puts "#{player2.player_name}: What does #{num1} #{operator} #{num2} equal?"
      end
      player_answer = gets.chomp
      raise InvalidGuessError unless player_answer.match(/^-?\d+\.?\d*$/)
    rescue InvalidGuessError
      puts "Please enter a number."
    else
      proper_guess = true
      player_answer = player_answer.to_f
    end
  end
  player_answer
end

def give_feedback(who_is_playing, player_answer, correct_answer, player1, player2)
  if player_answer == correct_answer
    who_is_playing == 1 ? player1.gain_point : player2.gain_point
    puts "\nCorrect!\n".green
  else
    who_is_playing == 1 ? player1.lose_life : player2.lose_life
    puts "\nIncorrect!  The correct answer is #{correct_answer}.\n".red
    display_scores(player1, player2)
  end
end

def is_alive?(player1,player2)
  player1.lives != 0 && player2.lives != 0
end




