class CreateMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :movements do |t|
      t.date :date
      t.string :description
      t.integer :value
      t.integer :balance

      t.timestamps
    end
  end
end
