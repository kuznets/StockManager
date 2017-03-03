class StocksController < ApplicationController
	before_filter :authenticate_user!, :except => [:index]

	#GET /stocks and GET /
	def index
		# @stocks = Stock.all
		if current_user
			@stocks = current_user.stocks.all
		else
			@stocks = Stock.all
		end
	end

	#GET /stocks/:id
	def show
		@stock = Stock.find(params[:id])
		date = @stock.created_at
		date = date.to_s(:db)
		date = date.split(' ')
		@start_date = date[0]
		year = @start_date.split('-')
		@start_year = year[0]

		@dividend_yield = []
		i = 1
		total = @stock.unit_price

		while (i < @stock.duration + 1) do
			total = (total / 100 ) * @stock.duration + total
			#puts i.to_s + ' total: ' + total.to_s
			@dividend_yield << {'year'=>i, 'total'=>total}
			i += 1
		end
		#puts @dividend_yield

	end

	#GET /stocks/new
	def new
		@stock = Stock.new
	end

	#POST /stocks
	def create
		if stock_params["unit_price"].scan(',')
			price = stock_params["unit_price"].split(',')
			price = price.join
		end
		params = stock_params
		params[:unit_price] = price

		@stock = current_user.stocks.new(params)

		if @stock.save
			redirect_to root_path, notice: 'Stock was successfully created.'
		else
			render 'new'
		end
	end

	private
	def stock_params
		params.require(:stock).permit(:name, :unit_price, :interest, :duration)
	end
end
