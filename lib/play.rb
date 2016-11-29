def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(input)
  input.to_i - 1
end
def position_taken?(board, index)
     if board[index] == "X" || board[index] ==  "O"
       true
     elsif board[index] == " " || board[index] == "" || board[index] == nil
       false
     end
   end

def valid_move?(board, index)
  if position_taken?(board, index)
    false
  elsif index == nil || index < 0 || index > 8
    false
  else
    true
  end
end

def move(board, location, current_player = "X")
   board[location] = current_player
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  valid_move = valid_move?(board, index)
  if valid_move == true
       move(board, index, "X")
       display_board(board)
   else
     puts "please enter 1-9:"
     input = gets.strip
 end

end
def over?(board)
   if draw?(board) || won?(board)
      true
   else
      false
  end
 end

 def draw?(board)
    won?(board) == false && full?(board) == true
 end

def play(board)
  while over?(board) == false
       turn(board)
     end
     if won?(board)
       puts "Congratulations #{winner(board)}!"
     elsif
       puts "Cats Game!"
     end
end
# Define your play method below
