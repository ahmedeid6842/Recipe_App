require 'rails_helper'

RSpec.describe 'Visit shopping list page', type: :feature do
  before :each do
    @user = User.create(name: 'User name', email: 'email@test.com', password: 'password123')
    @recipe = Recipe.create(name: 'My new recipe', user: @user, preparation_time: 15, cooking_time: 15,
                            description: 'description 1', public: true)
    @food = Food.create(name: 'Food name', user: @user, quantity: 1, measurement_unit: 'kg', price: 10.0)
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 8)

    sign_in @user
    visit recipe_shopping_list_index_path(@recipe)
  end

  it 'Should render a list of foods' do
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Food name')
  end
end
