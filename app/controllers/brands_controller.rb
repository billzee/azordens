class BrandsController < ApplicationController
	def index
		@brands = Brand.order :name
  	render "index"
	end

	def create
    @client = Client.new(params[:client])
    if @client.save
      redirect_to @client
    else
      render "new"
    end
  end

  def new
    render "new"
  end
end

