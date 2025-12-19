# frozen_string_literal: true

##
# This class represents a board of the tic tac toe game
class ThreeByThreeBoard
  attr_accessor :board

  def initialize
    @board = [['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']]
  end

  def update_board(location, mark_type)
    #     0 1 2
    #     -----
    # 0 | 7 8 9
    # 1 | 4 5 6
    # 2 | 1 2 3
    row_index, column_index = find_position_from_input(location)

    if board[row_index][column_index] == '-'
      board[row_index][column_index] = mark_type # TODO: check if the mark_type is valid? And the location is within range
    else
      'Please try a different location' # TODO: add more logic here?, currently, nothing would show up
    end
  end

  # have a helper function that determine if X or O has won
  # if no one wins and no more move, it's a draw
  def determine_winner(mark_type)
    # return the mark_type if it wins or nil
    # (I suppose it should be fine to return a boolean as well, depending on if mark_type wins)
    check_board_by_row(mark_type) || check_board_vertically_and_diagonally(mark_type)
  end

  def display
    puts '-------------'
    puts "| #{find_character_from_input(7)} | #{find_character_from_input(8)} | #{find_character_from_input(9)} |"
    puts '----+---+----'
    puts "| #{find_character_from_input(4)} | #{find_character_from_input(5)} | #{find_character_from_input(6)} |"
    puts '----+---+----'
    puts "| #{find_character_from_input(1)} | #{find_character_from_input(2)} | #{find_character_from_input(3)} |"
    puts '-------------'
    # puts ' X | X : X '
    # puts '---+---+----'
    # puts ' X | X : X '
    # puts '---+---+----'
    # puts ' X | X : X '
  end

  private

  def find_position_from_input(input)
    # From observation, we have: input = -3 * row_index + column_index + 7
    # From further observation, column_index seems to be...
    column_index = (input - 7) % 3
    # Now, we can deduct row_index
    row_index = (column_index + 7 - input) / 3
    [row_index, column_index]
  end

  def find_character_from_input(input)
    row_index, column_index = find_position_from_input(input)
    board[row_index][column_index]
  end

  def check_board_by_row(mark_type)
    board.each do |row|
      return mark_type if row.all? { |element| [mark_type].include?(element) }
    end
    nil
  end

  def check_board_vertically_and_diagonally(mark_type)
    locations_array = [[7, 4, 1], [8, 5, 2], [9, 6, 3], [7, 5, 3], [9, 5, 1]]
    locations_array.each do |locations|
      return mark_type if locations.all? do |location|
        mark = find_character_from_input(location)
        mark == mark_type
      end
    end
    nil
  end
end

def test_update_board
  board1 = ThreeByThreeBoard.new
  p board1.board
  board1.update_board(7, 'X')
  board1.update_board(7, 'X')
  board1.update_board(8, 'O')
  board1.update_board(6, 'X')
  board1.update_board(1, 'O')
  board1.update_board(2, 'X')
  board1.update_board(3, 'X')
  p board1.board
end

def test_determine_winner_by_row
  board1 = ThreeByThreeBoard.new
  board1.update_board(1, 'O')
  board1.update_board(2, 'O')
  board1.update_board(3, 'O')
  # p board1.board
  p board1.determine_winner('O')
end

def test_determine_winner_diagonally
  board1 = ThreeByThreeBoard.new
  board1.update_board(1, 'X')
  board1.update_board(5, 'X')
  board1.update_board(9, 'X')
  # p board1.board
  p board1.determine_winner('X')
end

def test_determine_winner_vertically
  board1 = ThreeByThreeBoard.new
  board1.update_board(6, 'X')
  board1.update_board(3, 'X')
  board1.update_board(9, 'X')
  # p board1.board
  p board1.determine_winner('X')
end

def test_determine_winner_vertically_nil
  board1 = ThreeByThreeBoard.new
  board1.update_board(8, 'X')
  board1.update_board(4, 'X')
  board1.update_board(2, 'X')
  # p board1.board
  p board1.determine_winner('X')
end

def test_display
  board1 = ThreeByThreeBoard.new
  board1.update_board(9, 'X')
  board1.update_board(7, 'O')
  board1.update_board(4, 'X')
  board1.update_board(6, 'O')
  board1.update_board(3, 'X')
  board1.update_board(2, 'O')
  board1.display
end

# test_update_board
test_determine_winner_by_row
test_determine_winner_diagonally
test_determine_winner_vertically
test_determine_winner_vertically_nil # should be nil
test_display
