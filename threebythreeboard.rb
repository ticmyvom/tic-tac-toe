# frozen_string_literal: true

##
# This class represents a board of the tic tac toe game
class ThreeByThreeBoard
  attr_reader :board

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
      board[row_index][column_index] = mark_type
      'Done'
    else
      'Please try a different location'
    end
  end

  # detects if mark_type has won or if there is any more move left
  # return mark_type if it wins
  # or nil if no one wins yet
  # or 'Draw' otherwise
  def determine_winner(mark_type)
    result = check_board_by_row(mark_type) || check_board_vertically_and_diagonally(mark_type)
    if result.nil?
      result = if more_move?
                 nil
               else
                 'Draw'
               end
    end
    result
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

  def more_move?
    [*1..9].any? { |location| find_character_from_input(location) == '-' }
  end

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
