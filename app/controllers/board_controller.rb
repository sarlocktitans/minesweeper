class BoardController < ApplicationController
	before_filter :board_values, only:[:index]
	def index
	end

	def show
	end
	
	def edit
	end

	def update
	end

	def build_board
		matrix = Array.new(8) { Array.new(8, 0) }
		matrix.each do |row|
			bomb = rand(1..3)
			while bomb>0 do 
				if bomb>0
					row[rand(0..7)] = 1
					bomb -=1
				end
			end
		end
		matrix[0][0] = 1
		matrix
	end

	def board_values
		@board = build_board
		matrix = Array.new(8) { Array.new(8, 0) }
		x=0
		matrix.each do |row|
			y =0
			row.each do |col|
				if @board[x][y] == 1
					row[y] = -1
				else
					row[y] = find_value x,y
				end
				y+=1
			end
			x+=1
		end
		@board_value = matrix
	end

	def find_value x,y
		count = 0
		xx = x-1

		if xx < 0
			xx = 0
		end

		while xx <= x+1 && xx<=7 do 
			yy = y-1
			if yy<0
				yy = 0
			end
			while yy <= y+1 && yy<8 do
				if yy > 7
					yy = 7
				end
			  if @board[xx][yy]==1
				  count+=1
			  end
			  yy+=1
		  end
		  xx+=1
		end
		count		
	end

end
