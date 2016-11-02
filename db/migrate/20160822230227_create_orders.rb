class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.string :defect, null: false
    	t.string :serial_number, null: true
    	t.text :observation, null: true
      t.string :value, null: true
      t.boolean :visible, default: true, null: false

      t.timestamp :in_progress_at, null: true
      t.timestamp :done_at, null: true
      t.timestamp :delivered_at, null: true
      t.timestamp :closed_at, null: true
      t.timestamp :cancelled_at, null: true

      t.timestamps
    end
  end
end
