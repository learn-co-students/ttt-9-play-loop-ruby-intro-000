

 def play(board)
   counter = 0
   while counter < 9
     counter +=1
     turn(board)
     puts "HELOOWOWOWOWOWO"
     puts counter
   end
 end


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

def win_state?(board)
  hwin = horizontal_win(board, 0) || horizontal_win(board, 3) || horizontal_win(board, 6)
  vwin = verticle_win(board, 0) || verticle_win(board, 1) ||  verticle_win(board, 2)

  dwin = diagonal_winA(board, 0) || diagonal_winB(board, 2)

  dwin = diagonal_win(board, 0) || diagonal_win(board, 2)

  return hwin || vwin || dwin
end

def horizontal_win(board, row)
  return (board[row] == "X" && board[row+1] == "X" && board[row+2] == "X") || (board[row] == "O" && board[row+1] == "O" && board[row+2] == "O")
end

def verticle_win(board, row)
  return (board[row] == "X" && board[row+3] == "X" && board[row+6] == "X") || (board[row] == "O" && board[row+3] == "O" && board[row+6] == "O")
end

def diagonal_winA(board, row)
  return (board[row] == "X" && board[row+4] == "X" && board[row+8] == "X") || (board[row] == "O" && board[row+4] == "O" && board[row+8] == "O")
end

def diagonal_winB(board, row)
  return (board[row] == "X" && board[row+2] == "X" && board[row+4] == "X") || (board[row] == "O" && board[row+2] == "O" && board[row+4] == "O")
end
# Define your play method below
