class CreateMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :movements do |t|
      t.date :date
      t.string :description
      t.integer :value_cents
      t.integer :balance_cents

      t.timestamps
    end
  end
end
