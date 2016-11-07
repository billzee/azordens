class BrandsController < ApplicationController
	before_action :authenticate_user!

	def index
		if params[:date]
			date = JSON.parse(params[:date])
			@brands = Brand.where(created_at: date["start"]..date["end"]).order :created_at
		else
			@brands = Brand.order :name
		end
		respond_to do |format|
		  format.html
		  format.json { render json: @brands }
		 end
	end

	def create
    @brand = Brand.new(brand_params)
    if @brand.save
			redirect_to brands_path
			flash[:notice] = "Nova Marca registrada"
    else
			flash[:error] = @brand.errors.full_messages
			redirect_to new_brand_path
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
			redirect_to brands_path
			flash[:notice] = "Marca alterada"
		else
			flash[:error] = @brand.errors.full_messages
			redirect_to edit_brand_path(@brand)
		end
	end

	def destroy
		@brand = Brand.find params[:id]
		if @brand.visible
			@brand.update(visible: false)
			redirect_to brands_path
			flash[:notice] = "Marca ocultada"
		else
			@brand.update(visible: true)
			redirect_to edit_brand_path(@brand)
			flash[:notice] = "Marca está visível"
		end
	end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
