# frozen_string_literal: true

##
# This class represents a player in a game of tic tac toe
class Player
  attr_reader :mark_type

  def initialize(mark_type)
    @mark_type = mark_type # X or O
    @won = false # whether they has won the game
  end

  ##
  # Set the player's mark at a given position on the board
  def determine_mark_location
    puts "Player #{mark_type}, where would you like to place your mark?"
    gets.chomp
  end
end

def test_determine_mark_location
end
