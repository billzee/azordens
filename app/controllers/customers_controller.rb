class CustomersController < ApplicationController
  def index
		@customers = Customer.order :first_name
  	render "index"
	end

	def create
    @customer = Customer.new(customer_params)
    if @customer.save
			flash[:notice] = "Novo Cliente registrado"
      index
    else
      render "new"
    end
  end

  def new
    @customer = Customer.new
    # @brands_array = Brand.order :name
    render "new"
  end

  def edit
    @customer = Customer.find(params[:id])
    render "edit"
  end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			flash[:notice] = "Equipamento alterado"
			redirect_to customers_path
		else
			render "edit"
		end
	end

	def destroy
		@customer = Customer.find params[:id]
		@customer.destroy
	end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone)
  end
end
