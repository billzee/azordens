class EquipmentsController < ApplicationController
	before_action :authenticate_user!

	def index
		if params[:date]
      date = JSON.parse(params[:date])
      @all_equipment = current_user.equipment.where(created_at: date["start"]..date["end"]).order :created_at
    else
      @all_equipment = current_user.equipment.order :created_at
    end
		respond_to do |format|
			format.html
			format.json { render json: @all_equipment }
		 end
	end

	def create
    @equipment = Equipment.new(equipment_params)
		@equipment.user = current_user
    if @equipment.save
      redirect_to equipments_path
			flash[:notice] = "Novo Equipamento registrado"
    else
			flash[:error] = @equipment.errors.full_messages
      redirect_to new_equipment_path
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
			flash[:error] = @equipment.errors.full_messages
			redirect_to edit_equipment_path(@equipment)
		end
	end

	def destroy
		@equipment = Equipment.find params[:id]
		if @equipment.visible
			@equipment.update(visible: false)
			redirect_to equipments_path
			flash[:notice] = "Equipamento ocultado"
		else
			@equipment.update(visible: true)
			redirect_to edit_equipment_path(@equipment)
			flash[:notice] = "Equipamento está visível"
		end
	end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :model, :description, :brand_id)
  end
end
