class EquipmentsController < ApplicationController
	def index
		@all_equipment = Equipment.order :name
	  	render "index"
	end

	def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      index
    else
      render "new"
    end
  end

  def new
    @equipment = Equipment.new
    @brands_array = Brand.order :name
    render "new"
  end

  def edit
    @equipment = Equipment.find(params[:id])
    render "edit"
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :model, :description, :brand_id)
  end
end

