

class Players
  @@cross_posn_array = []
  @@circle_posn_array = []
  @@turn = 'cross'
  @@game_board = Array.new(3) { Array.new(3 , ".")}
  @@game_over = false
  def initialize(posn_x, posn_y)
    @posn_x = posn_x
    @posn_y = posn_y
  end

  def self.returns_game_board
    return @@game_board
  end

  def self.returns_game_status
    return @@game_over
  end

  def self.check_if_game_over(input_array)
    Players.check_lines(input_array) || Players.check_diagonals(input_array)
  end

  def self.check_lines(input_array)
    (0..2).any? do |prim_iter|
      (0..2).all? {|second_iter| input_array.include?([second_iter, prim_iter])}
    end
  end

  def self.check_diagonals(input_array)
    false
    #(0..2).all? {|prim_iter| input_array.include?([prim_iter, prim_iter])} || (0..2).all? {|prim_iter| @cross_posn_array.include?([prim_iter, 2 - prim_iter])}
  end

  def self.play
    if @@turn == 'cross'
      x_value = gets.chomp.to_i
      y_value = gets.chomp.to_i
      if !(@@cross_posn_array + @@circle_posn_array).include?([x_value, y_value])
        Cross.new(x_value, y_value)
        @@game_over = Cross.check_if_game_over_cross
        @@turn = 'circle'
        puts 
      else
        puts 'Wrong input, please try again.'
      end
    elsif @@turn == 'circle'
      x_value = gets.chomp.to_i
      y_value = gets.chomp.to_i
      if !(@@cross_posn_array + @@circle_posn_array).include?([x_value, y_value])
        Circle.new(x_value, y_value)
        @@game_over = Circle.check_if_game_over_circle
        @@turn = 'cross'
      else
        puts 'Wrong input, please try again.'
      end
    end
  end
end

class Cross < Players
  def initialize(posn_x, posn_y)
    super
    @@cross_posn_array.push([posn_x, posn_y])
    @@game_board[posn_y][posn_x] = 'X'
  end

  def self.check_if_game_over_cross
    check_if_game_over(@@cross_posn_array)
  end
end

class Circle < Players
  def initialize(posn_x, posn_y)
    super
    @@circle_posn_array.push([posn_x, posn_y])
    @@game_board[posn_y][posn_x] = 'O'
  end

  def self.check_if_game_over_circle
    check_if_game_over(@@circle_posn_array)
  end
end

while !Players.returns_game_status
  Players.play
  game_board_extract = Players.returns_game_board
  width = game_board_extract.flatten.max.to_s.size+2
  puts game_board_extract.map { |a| a.map { |i| i.to_s.rjust(width) }.join }
end