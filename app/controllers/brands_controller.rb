class BrandsController < ApplicationController
	def index
		@brands = Brand.order :name
  	render "index"
	end

	def create
    @brand = Brand.new(brand_params)  
    if @brand.save
      render "index"
    else
      render "new"
    end
  end

  def new
    @brand = Brand.new
    render "new"
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end

