class BrandsController < ApplicationController

	def index
		@brands = Brand.order :name
		respond_to do |format|
		  format.html
		  format.json { render json: @brands }
		 end
	end

	def all
		@brand = Brand.order :name
		puts 'aqui' + @brand.to_json
	end

	def create
    @brand = Brand.new(brand_params)
    if @brand.save
			flash[:notice] = "Nova Marca registrada"
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
		@brand = Brand.find(params[:id])
    if @brand.update(brand_params)
			flash[:notice] = "Marca alterada"
			redirect_to brands_path
		else
			render "edit"
		end
	end

	def destroy
		@brand = Brand.find params[:id]
	  @brand.destroy
	end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
