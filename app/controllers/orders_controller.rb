class OrdersController < ApplicationController
  def index
		@orders = Order.order :id
  	render "index"
	end

	def create
    @order = Equipment.new(order_params)
    if @order.save
			flash[:notice] = "Nova OS registrada"
      index
    else
      render "new"
    end
  end

  def new
    @order = Equipment.new
    @brands_array = Brand.order :name
    render "new"
  end

  def edit
    @order = Equipment.find(params[:id])
    render "edit"
  end

	def update
		@order = Equipment.find(params[:id])
		if @order.update(order_params)
			flash[:notice] = "Equipamento alterado"
			redirect_to orders_path
		else
			render "edit"
		end
	end

	def destroy
		@order = Equipment.find params[:id]
		@order.destroy
	end

  private

  def order_params
    params.require(:order).permit(:name, :model, :description, :brand_id)
  end
end
