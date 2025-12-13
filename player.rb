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
  # Ask the player to input their mark's location
  # Return the desired location as an absolute integer or 0 otherwise
  def determine_mark_location
    puts "Player #{mark_type}, where would you like to place your mark?"
    gets.chomp.to_i.abs
  end
end

def test_determine_mark_location
  player_x = Player.new('X')
  player_x.determine_mark_location
end

p test_determine_mark_location
