class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(num)
    self.cells[num.to_i - 1]
  end

  def full?
    self.cells.include?(" ") ? false : true
  end

  def turn_count
    self.cells.delete_if {|cell| cell == " "}.size
  end

  def taken?(num)
    position(num) == "X" || position(num) == "O"
  end

  def valid_move?(num)
    num.to_i.between?(1, 9) && !taken?(num)
  end

  def update(num, player)
    self.cells[num.to_i - 1] = player.token
    self
  end


end
