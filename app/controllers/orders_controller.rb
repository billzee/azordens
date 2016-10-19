class OrdersController < ApplicationController
  def index
		@orders = Order.order :created_at
		respond_to do |format|
			format.html
			format.json { render json: @orders }
		 end
	end

	def create
    @order = Order.new(order_params)
    if @order.save
			flash[:notice] = "Nova OS registrada"
      redirect_to orders_path
    else
      render "new"
    end
  end

  def new
    @order = Order.new
    render "new"
  end

  def edit
    order = Order.find(params[:id])
    arr = []
    currStatus = Order.statuses[order.status]
    Order.statuses_settings.map do |label, status, key|
      if currStatus < key
        arr.push([label, status])
      end
		end

    @available_statuses = arr
    p arr
    @order = order

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
    params.require(:order).permit(:customer_id, :equipment_id, :defect, :serial_number, :observation, :status)
  end
end
