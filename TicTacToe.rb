#TicTacToe.rb

# ask how many players and make sure there are either 1 or 2
number_of_players = 0
loop do
	puts "How many players want to play Tic-Tac-Toe?(1/2)" 
	number_of_players = gets.to_i
	break if number_of_players == 1 || number_of_players == 2
end

# Tic-Tac-Toe board
board = [["#", "#", "#"],	
		 		 ["#", "#", "#"],
		 		 ["#", "#", "#"]]

# method for redrawing the board
def draw(board)
	board.each {|i| print "#{i}\n"}
end
draw(board)
# board indices					for user input
# 0,0_|_0,1_|_0,2 			1,1_|_1,2_|_1,3
# 1,0_|_1,1_|_1,2 			2,1_|_2,1_|_2,3
# 2,0 | 2,1 | 2,2 			3,1 | 3,1 | 3,3

# X starts the game
whose_turn = "X"

# begin game loop max 9 turns
count = 1
loop do
	# checks if turn is user for user input if 2 players or X, X is always user
	if number_of_players == 2 || whose_turn == "X"
		loop do
			# user input
			puts "#{whose_turn}, which row do you want to select?(1/2/3)"
			row  = gets.to_i
			puts "And which column do you want to select?(1/2/3)"
			col = gets.to_i

			# row and column subtraction for 0 index
			row -= 1
			col -= 1

			# position validation
			# if the input is too high or low 
			if row >= 0 && row <= 2 && col >= 0 && col <= 2
			# or the column is filled
				if board[row][col] == "#"
					# draws place in board
					board[row][col] = whose_turn
					break 
				else
					puts "Invalid move, choose again"
				end
			end
		end
	end

	# for single player 
	if number_of_players == 1 && whose_turn == "O"
		# checks if computer selected a position 
		# (re)initialize turn variable on new turn
		turn = 0
		# computer steps... go for win, go for block, go for middle, random
		# Step 1: go for win
		# check for potential win from the middle
		if board[1][1] == whose_turn
			# vertical
			if board[0][1] == whose_turn && board[2][1] == "#"
				board[2][1] = whose_turn
				turn = 1
			elsif board[0][1] == "#" && board[2][1] == whose_turn
				board[0][1] = whose_turn
				turn = 1
			# horizontal
			elsif board[1][0] == whose_turn && board[1][2] == "#"
				board[1][2] = whose_turn
				turn = 1
			elsif board[1][0] == "#" && board[1][2] == whose_turn
				board[1][0] = whose_turn
				turn = 1
			# diagonal top-bottom
			elsif board[0][0] == whose_turn && board[2][2] == "#"
				board[2][2] = whose_turn
				turn = 1
			elsif board[0][0] == "#" && board[2][2] == whose_turn
				board[0][0] = whose_turn
				turn = 1
			# diagnoal bottom-top
			elsif board[2][0] == whose_turn && board[0][2] == "#"
				board[0][2] = whose_turn
				turn = 1
			elsif board[2][0] == "#" && board[0][2] == whose_turn
				board[2][0] = whose_turn
				turn = 1
			end
		end
		# go for win on the top
		if turn == 0
			if board[0][1] == whose_turn && board[0][0] == whose_turn && board[0][2] == "#"
				board[0][2] = whose_turn
				turn = 1
			elsif board[0][1] == whose_turn && board[0][0] == "#" && board[0][2] == whose_turn
				board[0][0] = whose_turn
				turn = 1
			elsif board[0][1] == "#" && board[0][0] == whose_turn && board[0][2] == whose_turn
				board[0][1] = whose_turn
				turn = 1
			end
		end

		# go for win on the right
		if turn == 0
			if board[1][2] == whose_turn && board[0][2] == whose_turn && board[2][2] == "#"
				board[2][2] = whose_turn
				turn = 1
			elsif board[1][2] == whose_turn && board[0][2] == "#" && board[2][2] == whose_turn
				board[0][2] = whose_turn
				turn = 1
			elsif board[1][2] == "#" && board[0][2] == whose_turn && board[2][2] == whose_turn
				board[1][2]
				turn = 1
			end
		end
		# go for win on the bottom
		if turn == 0
			if board[2][1] == whose_turn && board[2][0] == whose_turn && board[2][2] == "#"
				board[2][2] = whose_turn
				turn = 1
			elsif board[2][1] == whose_turn && board[2][0] == "#" && board[2][2] == whose_turn
				board[2][0] = whose_turn
				turn = 1
			elsif board[2][1] == "#" && board[2][0] == whose_turn && board[2][2] == whose_turn
				board[2][1] = whose_turn
				turn = 1
			end
		end
		# go for win on the left
		if turn == 0
			if board[0][1] == whose_turn && board[0][0] == whose_turn && board[2][0] == "#"
				board[2][0] = whose_turn
				turn = 1
			elsif board[0][1] == whose_turn && board[0][0] == "#" && board[2][0] == whose_turn
				board[0][0] = whose_turn
				turn = 1
			elsif board[1][0] == "#" && board[0][0] == whose_turn && board[2][0] == whose_turn
				board[1][0] = whose_turn
				turn = 1
			end
		end

		# Step 2: go for block
		if turn == 0
			if board[1][1] == "X"
				# vertical 
				if board[0][1] == "X" && board[2][1] == "#"
					board[2][1] = whose_turn
					turn = 1
				elsif board[0][1] == "#" && board[2][1] == "X"
					board[0][1] = whose_turn
					turn = 1
				# horizontal
				elsif board[1][0] == "X" && board[1][2] == "#"
					board[1][2] = whose_turn
					turn = 1
				elsif board[1][0] == "#" && board[1][2] == "X"
					board[1][0] = whose_turn
					turn = 1
				# diagonal top-bottom
				elsif board[0][0] == "X" && board[2][2] == "#"
					board[2][2] = whose_turn
					turn = 1
				elsif board[0][0] == "#" && board[2][2] == "X"
					board[0][0] = whose_turn
					turn = 1
				# diagnoal bottom-top
				elsif board[2][0] == "X" && board[0][2] == "#"
					board[0][2] = whose_turn
					turn = 1
				elsif board[2][0] == "#" && board[0][2] == "X"
					board[2][0] = whose_turn
					turn = 1
				end
			end
		end
		# go for block on the top
		if turn == 0
			if board[0][1] == "X" && board[0][0] == "X" && board[0][2] == "#"
				board[0][2] = whose_turn
				turn = 1
			elsif board[0][1] == "X" && board[0][0] == "#" && board[0][2] == "X"
				board[0][0] = whose_turn
				turn = 1
			elsif board[0][1] == "#" && board[0][0] == "X" && board[0][2] == "X"
				board[0][1] = whose_turn
				turn = 1
			end
		end
		# go for block on the right
		if turn == 0
			if board[1][2] == "X" && board[0][2] == "X" && board[2][2] == "#"
				board[2][2] = whose_turn
				turn = 1
			elsif board[1][2] == "X" && board[0][2] == "#" && board[2][2] == "X"
				board[0][2] = whose_turn
				turn = 1
			elsif board[1][2] == "#" && board[0][2] == "X" && board[2][2] == "X"
				board[1][2] = whose_turn
				turn = 1
			end
		end
		# go for block on the bottom
		if turn == 0
			if board[2][1] == "X" && board[2][0] == "X" && board[2][2] == "#"
				board[2][2] = whose_turn
				turn = 1
			elsif board[2][1] == "X" && board[2][0] == "#" && board[2][2] == "X"
				board[2][0] = whose_turn
				turn = 1
			elsif board[2][1] == "#" && board[2][0] == "X" && board[2][2] == "X"
				board[2][1] = whose_turn
				turn = 1
			end
		end
		# go for block on the left
		if turn == 0
			if board[0][1] == "X" && board[0][0] == "X" && board[2][0] == "#"
				board[2][0] = whose_turn
				turn = 1
			elsif board[0][1] == "X" && board[0][0] == "#" && board[2][0] == "X"
				board[0][0] = whose_turn
				turn = 1
			elsif board[1][0] == "#" && board[0][0] == "X" && board[2][0] == "X"
				board[1][0] = whose_turn
				turn = 1
			end
		end

		# Step 3: middle move if available
		if board[1][1] == "#" && turn == 0
			board[1][1] = whose_turn

		elsif turn == 0
		# Step 4: random choice loop
			loop do
				# choose random row and column
				row = rand(3)
				col = rand(3)
				if board[row][col] == "#"
					# draws place in board
					board[row][col] = whose_turn
					break
				end
			end
		end
	end

	### check if last turn produced a win
	if count > 4
		# check if win is in the middle
		if board[1][1] == whose_turn
			# vertical
			if board[0][1] == whose_turn && board[2][1] == whose_turn
				puts "#{whose_turn} won the game!"
				break
			# horizontal
			elsif board[1][0] == whose_turn && board[1][2] == whose_turn
				puts "#{whose_turn} won the game!"
				break
			# diagonal top-bottom
			elsif board[0][0] == whose_turn && board[2][2] == whose_turn
				puts "#{whose_turn} won the game!"
				break
			# diagnoal bottom-top
			elsif board[2][0] == whose_turn && board[0][2] == whose_turn
				puts "#{whose_turn} won the game!"
				break
			end
		end
		# checks if win is on the top
		if board[0][1] == whose_turn && board[0][0] == whose_turn && board[0][2] == whose_turn
			puts "#{whose_turn} won the game!"
			break
		end
		# checks if win is on the right
		if board[1][2] == whose_turn && board[0][2] == whose_turn && board[2][2] == whose_turn
			puts "#{whose_turn} won the game!"
			break
		end
		# checks if win is on the bottom
		if board[2][1] == whose_turn && board[2][0] == whose_turn && board[2][2] == whose_turn
			puts "#{whose_turn} won the game!"
			break
		end
		# checks if win is on the left
		if board[1][0] == whose_turn && board[0][0] == whose_turn && board[2][0] == whose_turn
			puts "#{whose_turn} won the game!"
			break
		end
	end

	# redraws board on screen for player(s)
	if number_of_players == 2 || whose_turn == "O"
		draw(board)
	end

	#changes turn
	if whose_turn == "X"
		whose_turn = "O"
	else
		whose_turn = "X"
	end

	# increments the turn counter
	count += 1
	# ends game if turn counter is too high
	if count == 10 
		puts "No spots left"
		puts "Tie game"
		break
	end
end
draw(board)