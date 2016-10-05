class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :description, null: false
    	t.string :model, null: false

      t.timestamps
    end
  end
end
