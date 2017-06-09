class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    p1 = player1[1]
    p2 = player2[1]
    rules = {"R"=>"P","P"=>"S","S"=>"R"}
    if !(rules.key?(p1) or rules.key?(p2))
      raise NoSuchStrategyError
    elsif p1 == p2
      player1
    else
      rules[p1] == p2 ? player2 : player1
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].is_a?(Array)
      return winner(tournament_winner(tournament[0]),tournament_winner(tournament[1]))
    else
      return winner(tournament[0],tournament[1])
    end
  end
end