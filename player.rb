class Player
  attr_reader :score, :lives, :player_name
  @@num_of_players = 0
  def self.num_of_players
    @@num_of_players
  end

  def self.create_player(player_name)
    score = 0
    lives = 3
    player_num = @@num_of_players + 1
    self.new(player_name, player_num, score, lives)
  end

  def initialize(player_name, player_num, score, lives)
    @@num_of_players += 1

    @player_name = player_name
    @player_num = player_num
    @score = score
    @lives = lives
  end

  def gain_point()
    @score += 1
  end

  def lose_life()
    @lives -= 1
  end
end




