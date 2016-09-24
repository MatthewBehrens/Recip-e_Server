class CreateFavoriteRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :api_recipe_id
      t.integer :user_id

      t.timestamps
    end
  end
end
