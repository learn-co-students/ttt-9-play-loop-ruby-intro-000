# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

=begin this is Flatiron's turn method using recursion
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end
=end

def turn(board)
  #This is my method NOT using recursion
  puts "Please enter 1-9:"
  input = input_to_index(gets.chomp)
  if valid_move?(board, input) == false
    input = gets.chomp
  else
    move(board, input)
  end
  display_board(board)
end

def play(board)
  turn_num = 0
  while turn_num < 10
    turn(board)
    turn_num +=1
  end
end
