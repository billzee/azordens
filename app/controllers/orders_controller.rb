class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:date]
      date = JSON.parse(params[:date])
      @orders = current_user.orders.where(created_at: date["start"]..date["end"]).order :created_at
    else
      @orders = current_user.orders.order :created_at
    end
		respond_to do |format|
			format.html
			format.json { render json: @orders }
		 end
	end

	def create
    @order = Order.new(order_params)
    @order.status = :opened
    @order.user = current_user
    if @order.save
      redirect_to edit_order_path(@order)
      flash[:notice] = "OS registrada"
    else
      flash[:error] = @order.errors.full_messages
      redirect_to new_order_path
    end
  end

  def new
    @order = Order.new
    render "new"
  end

  def edit
    order = Order.find(params[:id])
    arr = []
    curr_status = Order.statuses[order.status]
    Order.statuses_settings.map do |label, status, key|
      if curr_status <= key
        arr.push([label, status])
      end
		end

    @available_statuses = arr
    @order = order

    render "edit"
  end

	def update
		@order = Order.find(params[:id])

    if order_params["status"] != @order.status
      case order_params["status"]
      when 'in_progress'
        @order.in_progress_at = Time.now
      when 'done'
        @order.done_at = Time.now
      when 'delivered'
        @order.delivered_at = Time.now
      when 'closed'
        @order.closed_at = Time.now
      when 'cancelled'
        @order.cancelled_at = Time.now
        @order.visible = false
      end
    end

		if @order.update(order_params)
      redirect_to edit_order_path(@order)
      flash[:notice] = "OS atualizada"
		else
      flash[:error] = @order.errors.full_messages
			redirect_to edit_order_path(@order)
		end
	end

	def destroy
		@order = Order.find params[:id]
		@order.destroy
	end

  private

  def order_params
    params.require(:order).permit(:customer_id, :equipment_id, :defect, :serial_number, :observation, :status, :value, :service)
  end
end
