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
      render :new
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
