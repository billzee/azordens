class AddCustomerToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :customer, index: true, null: false
  end
end
