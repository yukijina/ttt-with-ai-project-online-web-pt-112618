class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :current_player

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

  def initialize(player_1= Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @current_player = @player_1
  end

  def won?
    xo = self.board.cells.map.with_index(0) {|token, index| [token, index]}
    #=> [["X",0], ["O",1], ["X",2], ["X",3], ["X",4], ["X",5], ["X", 6], ["X",7],["O",8]]

    # "X" combination
    x_arr = xo.select do |xo_arr|
          xo_arr if xo_arr.first == "X"
        end.transpose  #=>[["X","X"....],[0,3...] ]
    x_arr = x_arr[1].combination(3).to_a  #=>[[0,3,5]...]

    # "O" combination
    o_arr = xo.select do |xo_arr|
         xo_arr if xo_arr.first == "O"
       end.transpose  #=>[["O","O"....],[1,2...] ]
    o_arr = o_arr[1].combination(3).to_a #=>[[1,2,4]...]

    #Cheking if "X" and "O" has winning combination
    WIN_COMBINATIONS.detect do |win_comb|
      if x_arr.include?(win_comb)
        x_arr.select do |x|
          win_comb if win_comb == x
        end
      elsif o_arr.include?(win_comb)
        o_arr.select do |o|
          win_comb if win_comb == o
        end
      else
        false
      end
    end
  end

  def draw?
    true if !won?
  end



end
