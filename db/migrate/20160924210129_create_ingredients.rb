class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.integer :kitchen_list_id
      t.integer :catgeory_id, null: false

      t.timestamps
    end
  end
end
