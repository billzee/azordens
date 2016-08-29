class AddEquipmentToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :equipment, index: true, null: false
  end
end
