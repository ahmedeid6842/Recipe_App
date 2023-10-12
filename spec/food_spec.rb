require 'rails_helper'
RSpec.describe Food, type: :model do
  before :each do
    @user = User.create(name: 'Nick Jhons', email: 'test@test.com', password: '123456')
    @recipe = Recipe.create(name: 'Pasta', user: @user, preparation_time: 15, cooking_time: 15,
                            description: 'description 1', public: false)
    @food = Food.create(name: 'Tomato', measurement_unit: 'kg', price: 1.5, quantity: 10, user: @user)
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 2)
  end
  describe 'Validations' do
    it 'Should be valid with a quatity greater or equal than 0' do
      expect(@recipe_food).to be_valid
    end
    it 'Should be invalid if quantity is not a number greater or equal to 0' do
      recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: -2)
      expect(recipe_food).not_to be_valid
    end
  end
end
