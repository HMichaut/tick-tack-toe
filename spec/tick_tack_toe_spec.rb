# frozen_string_literal: true

require './lib/tick_tack_toe'

describe '#check_if_game_over' do
  it "returns true for a vertical line" do
    input_array = [[0,0],[0,1],[0,2]]
    expect(check_if_game_over(input_array)).to be true
  end
  it "returns true for a horizontal line" do
    input_array = [[0,0],[1,0],[2,0]]
    expect(check_if_game_over(input_array)).to be true
  end
  it "returns false for a wrong line" do
    input_array = [[0,0],[0,1]]
    expect(check_if_game_over(input_array)).to_not be true
  end
  it "returns true for a diagonal line" do
    input_array = [[0,0],[1,1],[2,2]]
    expect(check_if_game_over(input_array)).to be true
  end
  it "returns true for a diagonal line on the other side"  do
    input_array = [[0,2],[1,1],[2,0]]
    expect(check_if_game_over(input_array)).to be true
  end
  it "returns false for a wrong line" do
    input_array = [[1,1],[2,2]]
    expect(check_if_game_over(input_array)).to_not be true
  end
end

describe "#check_lines" do
  it "returns true for a vertical line" do
    input_array = [[0,0],[0,1],[0,2]]
    expect(check_lines(input_array)).to be true
  end
  it "returns true for a horizontal line" do
    input_array = [[0,0],[1,0],[2,0]]
    expect(check_lines(input_array)).to be true
  end
  it "returns false for a wrong line" do
    input_array = [[0,0],[1,1],[2,2]]
    expect(check_lines(input_array)).to_not be true
  end
end

describe "#check_diagonals" do
  it "returns true for a diagonal line" do
    input_array = [[0,0],[1,1],[2,2]]
    expect(check_diagonals(input_array)).to be true
  end
  it "returns true for a diagonal line on the other side"  do
    input_array = [[0,2],[1,1],[2,0]]
    expect(check_diagonals(input_array)).to be true
  end
  it "returns false for a wrong line" do
    input_array = [[0,0],[0,1],[0,2]]
    expect(check_diagonals(input_array)).to_not be true
  end
end
