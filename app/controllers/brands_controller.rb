class BrandsController < ApplicationController
	def index
		@brands = Brand.order :name
  	render "index"
	end
end

