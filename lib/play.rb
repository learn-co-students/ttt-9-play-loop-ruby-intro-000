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
# Define your play method below
def play(board)
  counter = 1
    if counter % 2 == 0
      current_player = "O"
    else
    current_player = "X"
    end
  while counter < 10
    turn(board)
      #if board[0] == board[1] && board[1] == board[2]
      #  puts "#{board[0]} won!"
      #  break
    #elsif board[3] == board[4] && board[4] == board[5]
    #  puts "#{board[3]} won!"
    #  break
    #elsif board[6] == board[7] && board[7] == board[8]
    #  puts "#{board[6]} won!"
    #  break
    #elsif board[0] == board[3] && board[3] == board[6]
    #  puts "#{board[3]} won!"
    #  break
    #elsif board[4] == board[1] && board[1] == board[7]
    #  puts "#{board[1]} won!"
    #  break
    #elsif board[5] == board[8] && board[8] == board[2]
    #  puts "#{board[2]} won!"
    #  break
    #elsif board[0] == board[4] && board[4] == board[8]
    #  puts "#{board[4]} won!"
    #  break
    #elsif board[2] == board[4] && board[4] == board[6]
    #  puts "#{board[4]} won!"
    #  break
    #elsif counter == 9
    #  puts "Cat's Game: Game Over"
    #  break
    #else
    #  turn(board)
      counter += 1
  end
end
