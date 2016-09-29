class BrandsController < ApplicationController

	def index
		@brands = Brand.order :name
  	render "index"
	end

	def create
    @brand = Brand.new(brand_params)
    if @brand.save
      index
    else
      render "new"
    end
  end

  def new
    @brand = Brand.new
    render "new"
  end

  def edit
    @brand = Brand.find(params[:id])
    render "edit"
  end

	def update
		brand = Brand.find(params[:id])
    brand.update(brand_params)
    index
	end

	def destroy
		brand = Brand.find(params[:id])
		brand.destroy
		index
	end

  private

  def brand_params
    params.require(:brand).permit(:id, :name)
  end
end
