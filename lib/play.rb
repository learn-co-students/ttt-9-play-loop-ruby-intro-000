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

#checks array for three-in-a-row
def checker(array)
  gate = false;
  counter = 0
  while counter <= 7
    # horizontal 3 in a row
    if ((array[counter] != " ")  && ( array[counter] == array[counter + 1]) && (array[counter + 1] == array[counter + 2]))
      gate = true
    # vertical 3 in a row
  elsif ( array[counter] != " " && (counter <= 2) && (array[counter] == array[counter + 3]) && (array[counter + 3] == array[counter + 6]) )
      gate = true
    # going diagonal right
    elsif ( (array[counter] != " ") && (counter == 0 ) && (array[counter] == array[counter  + 4 ] )&& (array[counter + 4] == array[counter + 8])  )
      gate = true
    #going diagonal left
    elsif ( (array[counter] != " ") && (counter == 2) && (array[counter] == array[counter  + 2 ]) && (array[counter + 2] == array[counter + 4])  )
      gate = true
    else
      counter += 0
    end
    counter += 1
  end
  return gate
end

# Define your play method below
def play(board)
  winGate = checker(board)
  moveCount = 0
  while( moveCount <= 8 && !(winGate) )
    turn(board)
    moveCount += 1
  end
end
