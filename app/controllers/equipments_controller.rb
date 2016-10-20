class EquipmentsController < ApplicationController
	def index
		@all_equipment = Equipment.order :created_at
		respond_to do |format|
			format.html
			format.json { render json: @all_equipment }
		 end
	end

	def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to equipments_path
			flash[:notice] = "Novo Equipamento registrado"
    else
      render :new
    end
  end

  def new
    @equipment = Equipment.new
    render "new"
  end

  def edit
    @equipment = Equipment.find(params[:id])
    render "edit"
  end

	def update
		@equipment = Equipment.find(params[:id])
		if @equipment.update(equipment_params)
			redirect_to equipments_path
			flash[:notice] = "Equipamento alterado"
		else
			render "edit"
		end
	end

	def destroy
		@equipment = Equipment.find params[:id]
		@equipment.destroy
	end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :model, :description, :brand_id)
  end
end
