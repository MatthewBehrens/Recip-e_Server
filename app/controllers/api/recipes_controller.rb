module Api
  class RecipesController < ApplicationController
    respond_to :json
    def all
      p 'This is what the api instance looks like:::::::'

      # response = api.find_by_ingredients('chicken tomatoes')

      response = "{raw_body: '[{'id':649495,'title':'Lemon and Garlic Slow Roasted Chicken','image':'https://spoonacular.com/recipeImages/Lemon-and-Garlic-Slow-Roasted-Chicken-649495.jpg','imageType':'jpg','usedIngredientCount':1,'missedIngredientCount':2,'likes':1},{'id':640803,'title':'Crispy Buttermilk Fried Chicken','image':'https://spoonacular.com/recipeImages/Crispy-Buttermilk-Fried-Chicken-640803.jpg','imageType':'jpg','usedIngredientCount':1,'missedIngredientCount':2,'likes':53},{'id':634485,'title':'Bbq Chicken Pizza','image':'https://spoonacular.com/recipeImages/Bbq-Chicken-Pizza-634485.jpg','imageType':'jpg','usedIngredientCount':1,'missedIngredientCount':2,'likes':1},{'id':715525,'title':'Slow Cooker Rosemary Whole Chicken','image':'https://spoonacular.com/recipeImages/slow-cooker-rosemary-whole-chicken-715525.jpg','imageType':'jpg','usedIngredientCount':1,'missedIngredientCount':3,'likes':991},{'id':634463,'title':'Batter Fried Chicken','image':'https://spoonacular.com/recipeImages/Batter-Fried-Chicken-634463.jpg','imageType':'jpg','usedIngredientCount':1,'missedIngredientCount':3,'likes':8}]',
body: [
{
id: 649495,
title: 'Lemon and Garlic Slow Roasted Chicken',
image: 'https://spoonacular.com/recipeImages/Lemon-and-Garlic-Slow-Roasted-Chicken-649495.jpg',
imageType: 'jpg',
usedIngredientCount: 1,
missedIngredientCount: 2,
likes: 1
},
{
id: 640803,
title: 'Crispy Buttermilk Fried Chicken',
image: 'https://spoonacular.com/recipeImages/Crispy-Buttermilk-Fried-Chicken-640803.jpg',
imageType: 'jpg',
usedIngredientCount: 1,
missedIngredientCount: 2,
likes: 53
},
{
id: 634485,
title: 'Bbq Chicken Pizza',
image: 'https://spoonacular.com/recipeImages/Bbq-Chicken-Pizza-634485.jpg',
imageType: 'jpg',
usedIngredientCount: 1,
missedIngredientCount: 2,
likes: 1
},
{
id: 715525,
title: 'Slow Cooker Rosemary Whole Chicken',
image: 'https://spoonacular.com/recipeImages/slow-cooker-rosemary-whole-chicken-715525.jpg',
imageType: 'jpg',
usedIngredientCount: 1,
missedIngredientCount: 3,
likes: 991
},
{
id: 634463,
title: 'Batter Fried Chicken',
image: 'https://spoonacular.com/recipeImages/Batter-Fried-Chicken-634463.jpg',
imageType: 'jpg',
usedIngredientCount: 1,
missedIngredientCount: 3,
likes: 8
}
]
}"

  obj = ActiveSupport::JSON.decode(response)
      render json: obj
    end
  end
end

