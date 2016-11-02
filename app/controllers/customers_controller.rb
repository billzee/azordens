class CustomersController < ApplicationController
  def index
		@customers = Customer.order :created_at
		respond_to do |format|
			format.html
			format.json { render json: @customers }
		 end
	end

	def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
      flash[:notice] = "Novo Cliente registrado"
    else
      flash[:error] = @customer.errors.full_messages
			redirect_to new_customer_path
    end
  end

  def new
    @customer = Customer.new
    render "new"
  end

  def edit
    @customer = Customer.find(params[:id])
    render "edit"
  end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			redirect_to customers_path
      flash[:notice] = "Equipamento alterado"
		else
      flash[:error] = @customer.errors.full_messages
			redirect_to edit_customer_path(@customer)
		end
	end

  def destroy
		@customer = Customer.find params[:id]
		if @customer.visible
			@customer.update(visible: false)
			redirect_to customers_path
			flash[:notice] = "Cliente ocultado"
		else
			@customer.update(visible: true)
			redirect_to edit_customer_path(@customer)
			flash[:notice] = "Cliente está visível"
		end
	end
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone)
  end
end
