class Board
  attr_accessor :cells

  def initialize
    @cells = []
    sets
  end

  def reset!
    self.cells.clear
    sets
  end

  def sets
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
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
    self.cells[num.to_i - 1] == " " ? false : true
  end

  def valid_move?(num)
    if num.to_i == 0  #if num was character, num.to_i returns 0
      false
    else
      taken?(num) ? false : true
    end
  end

  def update(num, player)
    #valid_move?(num)
    self.cells[num.to_i - 1] = player.token
  end

end
