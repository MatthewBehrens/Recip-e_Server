User.create(first_name: 'Matt', last_name: 'Baker', email: 'mattbaker@dbc.com', username: 'bakerROX', password_hash: 'password')

KitchenList.create(user_id: 1)

Category.create(name: 'Dairy')
Category.create(name: 'Produce')
Category.create(name: 'Beverages')
Category.create(name: 'Meat')
Category.create(name: 'Bakery')
Category.create(name: 'Pantry')
Category.create(name: 'Frozen')

Ingredients.create(name: 'milk', kitchen_list_id: 1, category_id: 1)
Ingredients.create(name: 'apples', kitchen_list_id: 1, category_id: 2)
Ingredients.create(name: 'tonic water', kitchen_list_id: 1, category_id: 3)
Ingredients.create(name: 'ground beef', kitchen_list_id: 1, category_id: 4)
Ingredients.create(name: 'bagels', kitchen_list_id: 1, category_id: 5)
Ingredients.create(name: 'salt', kitchen_list_id: 1, category_id: 6)
Ingredients.create(name: 'pizza', kitchen_list_id: 1, category_id: 7)

Recipe.create(name: 'Apple Pie', description: 'Amer')
