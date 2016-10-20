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
    @order.status = :opened
    if @order.save
      redirect_to orders_path
      flash[:notice] = "Nova OS registrada"
    else
      render :new
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
    @order = order

    render "edit"
  end

	def update
		@order = Order.find(params[:id])

    case @order.status # a_variable is the variable we want to compare
    when 'in_progress'    #compare to 1
      @order.in_progress_at = Time.now
    when 'done'    #compare to 2
      @order.done_at = Time.now
    when 'delivered'    #compare to 2
      @order.delivered_at = Time.now
    when 'closed'    #compare to 2
      @order.closed_at = Time.now
    when 'cancelled'    #compare to 2
      @order.cancelled_at = Time.now
    end

		if @order.update(order_params)
			redirect_to orders_path
      flash[:notice] = "OS atualizada"
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
