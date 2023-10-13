require 'rails_helper'

RSpec.describe 'Edit an ingredient of a especific recipe ', type: :feature do
  before :each do
    @user = User.create(name: 'User name', email: 'email@test.com', password: 'password123')
    @recipe = Recipe.create(name: 'My new recipe', user: @user, preparation_time: 15, cooking_time: 15,
                            description: 'description 1', public: true)
    @food = Food.create(name: 'Food name', user: @user, quantity: 1, measurement_unit: 'kg', price: 10.0)
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 8)

    sign_in @user
    visit edit_recipe_food_path(@recipe_food.id)
  end

  scenario 'User creates a new recipe' do
    fill_in 'Quantity', with: 6
    click_button 'Modify'
    expect(page).to have_content('Recipe food updated successfully')
  end
end
