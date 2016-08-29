class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.string :defect
    	t.string :serial_number
    	t.text :observation

      t.timestamps
    end
  end
end
