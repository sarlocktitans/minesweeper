class BoardController < ApplicationController
	before_filter :build_board, only:[:index]
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
		@board =matrix
	end
end
