# frozen_string_literal: true

require_relative 'threebythreeboard'

puts 'Welcome to Tic-Tac-Toe, please have a friend ready.'
puts "Note: Use 1-9 on your numpad to enter your mark's location."

puts 'Player 1, would you like to be X or O?'
player1_mark_type = gets.chomp.upcase
if player1_mark_type != 'X' && player1_mark_type != 'O'
  puts 'Invalid mark. Your mark type is now set to X.'
  player1_mark_type = 'X'
end

player2_mark_type = (%w[X O] - [player1_mark_type])[0]
puts "Alright, player 2 is #{player2_mark_type}."

board = ThreeByThreeBoard.new

def prompt_input(mark_type)
  input = 0
  while [*1..9].include?(input) == false
    puts "Player #{mark_type}, where would you like to place your mark? Enter a digit from 1-9:"
    input = gets.chomp.to_i.abs
  end
  input
end

def set_mark(board, mark_type)
  location = prompt_input(mark_type)

  until board.update_board(location, mark_type) == 'Done'
    puts "Location #{location} is not valid. Please try a different one."
    location = prompt_input(mark_type)
  end
end

def announce(result, mark_type)
  if result == mark_type
    puts "Player #{mark_type} has won!"
  elsif result == 'Draw'
    puts "It's a draw!"
  else
    'Not yet'
  end
end

loop do
  set_mark(board, player1_mark_type)
  board.display
  result = board.determine_winner(player1_mark_type)
  break unless announce(result, player1_mark_type) == 'Not yet'

  set_mark(board, player2_mark_type)
  board.display
  result = board.determine_winner(player2_mark_type)
  break unless announce(result, player2_mark_type) == 'Not yet'
end
