class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
    	t.string :name
    	t.string :model
    	t.string :description

      t.timestamps
    end
  end
end
