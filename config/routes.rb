Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, constraints: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    get 'recipes' => 'recipes#all'
    post 'recipe' => 'recipes#show'
    post 'instructions' => 'recipes#instructions'

    get 'list' => 'lists#show'

    get 'pantry' => 'lists#show'
    post 'pantry' => 'lists#save'
    post 'ingredients' => 'recipes#ingredients_search'

    post 'favorite_recipes/:recipe_id' => 'recipes#add_favorite'
    get 'favorite_recipes' => 'recipes#favorites'
    delete 'favorite_recipes/:recipe_id' => 'recipes#remove_favorite'
  end

end
