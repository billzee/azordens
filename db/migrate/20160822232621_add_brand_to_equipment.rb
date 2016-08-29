class AddBrandToEquipment < ActiveRecord::Migration[5.0]
  def change
  	add_reference :equipment, :brand, index: true, null: false
  end
end
