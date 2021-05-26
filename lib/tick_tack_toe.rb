# frozen_string_literal: true

# variable initialization
turn = 'cross'
game_board = Array.new(3) { Array.new(3 , ".")}
game_over = false

# Array -> Boolean
# Consumes an array and returns a boolean informing if the situation is a 
# game over
def check_if_game_over(input_array)
  check_lines(input_array) || check_diagonals(input_array)
end

# Array -> Boolean
# Consumes an array and returns a boolean informing if the lines are in a game 
# over situation
def check_lines(input_array)
  (0..2).each do |row|
    if input_array.select {|item| item[0] == row}.length == 3
      return true
    end
  end
  (0..2).each do |column|
    if input_array.select {|item| item[1] == column}.length == 3
      return true
    end
  end
  false
end

# Array -> Boolean
# Consumes an array and returns a boolean informing if the diagonals are in a 
# game over situation
def check_diagonals(input_array)
  if input_array.select {|item| item[0] == item[1]}.length == 3
    return true
  elsif input_array.select {|item| item[0] + item[1] == 2}.length == 3
    return true
  end
  false
end

# Array -> Boolean
# Create a new play according to the player choice
def play(turn, game_board)
  x_value = gets.chomp.to_i
  y_value = gets.chomp.to_i
  if turn == 'cross'
    Cross.new(x_value, y_value)
    game_board[x_value][y_value] = 'X'
    puts "Cross plays posn x : #{x_value} posn y: #{y_value}"
  elsif turn == 'circle'
    Circle.new(x_value, y_value)
    game_board[x_value][y_value] = 'O'
    puts "Circle plays posn x : #{x_value} posn y: #{y_value}"
  end
end

# Represent players class
class Players
  @@cross_posn_array = []
  @@circle_posn_array = []
  # Reader function for class variable
  def self.return_cross_posn_array
    @@cross_posn_array 
  end

  # Reader function for class variable
  def self.return_circle_posn_array
    @@circle_posn_array 
  end

  # Basic initialize function for both players
  def initialize(posn_x, posn_y)
    @posn_x = posn_x
    @posn_y = posn_y
  end
end

# Specific class for cross player
class Cross < Players

  # Specific initialize function for cross players
  def initialize(posn_x, posn_y)
    super
    @@cross_posn_array.push([posn_x, posn_y])
  end
end

# Specific class for circle player
class Circle < Players
  # Specific initialize function for cross players
  def initialize(posn_x, posn_y)
    super
    @@circle_posn_array.push([posn_x, posn_y])
  end
end

# Game loop, will stop if in game over situation.
until game_over
  play(turn, game_board)
  if turn == 'circle'
    turn = 'cross'
    game_over = check_if_game_over(Players.return_circle_posn_array)
  elsif turn == 'cross'
    turn = 'circle'
    game_over = check_if_game_over(Players.return_cross_posn_array)
  end
  width = game_board.flatten.max.to_s.size+2
  puts(game_board.transpose.reverse.map { |a| a.map { |i| i.to_s.rjust(width) }.join })
end
puts 'GAME OVER!'
