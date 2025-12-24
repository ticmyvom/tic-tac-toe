# frozen_string_literal: true

require_relative '../threebythreeboard'
require 'minitest/autorun'

class TestThreeByThreeBoard < Minitest::Test
  def setup
    @test_board = ThreeByThreeBoard.new
  end

  def test_update_board
    @test_board.update_board(3, 'O')
    assert_equal 'O', @test_board.board[2][2]

    return_value = @test_board.update_board(7, 'X')
    assert_equal 'X', @test_board.board[0][0]
    assert_equal 'Done', return_value

    return_value = @test_board.update_board(7, 'X')
    assert_equal 'Please try a different location', return_value
  end

  def test_determnine_winner_by_row
    @test_board.update_board(1, 'O')
    @test_board.update_board(2, 'O')
    @test_board.update_board(3, 'O')
    assert_equal 'O', @test_board.determine_winner('O')
  end

  def test_determnine_winner_diagonally
    @test_board.update_board(1, 'O')
    @test_board.update_board(9, 'O')
    @test_board.update_board(5, 'O')
    assert_equal 'O', @test_board.determine_winner('O')
  end

  def test_determine_winner_vertically
    @test_board.update_board(6, 'X')
    @test_board.update_board(3, 'X')
    @test_board.update_board(9, 'X')
    assert_equal 'X', @test_board.determine_winner('X')
  end

  def test_determin_winner_no_one_wins_yet
    @test_board.update_board(1, 'O')
    @test_board.update_board(4, 'X')
    @test_board.update_board(6, 'O')
    assert_equal nil, @test_board.determine_winner('O')
  end

  def test_determin_winner_draw
    @test_board.update_board(1, 'O')
    @test_board.update_board(4, 'X')
    @test_board.update_board(6, 'O')
    @test_board.update_board(9, 'X')
    @test_board.update_board(2, 'O')
    @test_board.update_board(3, 'X')
    @test_board.update_board(8, 'O')
    @test_board.update_board(5, 'X')
    @test_board.update_board(7, 'O')
    assert_equal 'Draw', @test_board.determine_winner('O')
    assert_equal 'Draw', @test_board.determine_winner('X')
  end
end
