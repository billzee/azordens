class OrdersController < ApplicationController
  def index
		@orders = Order.order :id
  	render "index"
	end

	def create
    @order = Order.new(order_params)
    if @order.save
			flash[:notice] = "Nova OS registrada"
      index
    else
      render "new"
    end
  end

  def new
    @order = Order.new
    render "new"
  end

  def edit
    @order = Order.find(params[:id])
    render "edit"
  end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			flash[:notice] = "OS atualizada"
			redirect_to orders_path
		else
			render "edit"
		end
	end

	def destroy
		@order = Order.find params[:id]
		@order.destroy
	end

  private

  def order_params
    params.require(:order).permit(:customer_id, :equipment_id, :defect, :serial_number, :observation)
  end
end
