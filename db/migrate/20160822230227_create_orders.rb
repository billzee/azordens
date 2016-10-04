class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.string :defect, null: false
    	t.string :serial_number, null: true
    	t.text :observation, null: true

      t.timestamps
    end
  end
end
