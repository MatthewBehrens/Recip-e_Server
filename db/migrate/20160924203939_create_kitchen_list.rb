class CreateKitchenList < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchen_lists do |t|
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
