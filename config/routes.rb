Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, constraints: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    get 'recipes' => 'recipes#all'
    get 'recipe' => 'recipes#show'
    post 'ingredients' => 'recipes#ingredients_search'
    get 'list' => 'lists#show'
    get 'users/:id/favorite_recipes' => 'recipes#favorites'
  end

end
