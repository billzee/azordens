class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
    	t.string :name, null: false
    	t.string :model, null: true
    	t.string :description, null: true

      t.timestamps
    end
  end
end
