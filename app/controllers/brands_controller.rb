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
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end
end

