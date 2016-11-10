class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :email, null: true, unique: true
    	t.string :phone, null: true
      t.boolean :visible, default: true, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
