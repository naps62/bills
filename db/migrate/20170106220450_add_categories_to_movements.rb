class AddCategoriesToMovements < ActiveRecord::Migration[5.0]
  def change
    add_column :movements, :categories, :string
  end
end
