WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, player = "X")
  board[index] = player
  puts "#{display_board(board)}"
end

def position_taken?(board, index)
  (board[index] == " " || board[index] == "" || board[index] == nil) ? false : true
end

def valid_move?(board, index)
  (position_taken?(board, index) == false && index.between?(0, 8)) ? true : false
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
  else
    until valid_move?(board, index)
      puts "Please enter 1-9:"
      turn(board)
      input = gets.strip
      index = input_to_index(input)
    end
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |position|
    if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
      position
    elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
      position
    else
      false
    end
  end
end

def full?(board)
  board.all? {|token| token == "X"||token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board).is_a?(Array) || draw?(board) || full?(board)
end

def winner(board)
  won?(board).class != Array ? nil : board[won?(board)[0]]
end
