require "rails_helper"
RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: "Nick Jhons", email: "test@test.com", password: "123456")
    @recipe = Recipe.create(name: "Pasta", user: @user, preparation_time: 15, cooking_time: 15,
                            description: "description 1", public: false)
  end
  describe "Validations" do
    it "Should be valid with a name, preparation_time, cooking_time, and description" do
      expect(@recipe).to be_valid
    end
    it "Should be invalid without a name" do
      recipe = Recipe.create(name: "", user: @user, preparation_time: 15, cooking_time: 15,
                             description: "description 1", public: false)
      expect(recipe).not_to be_valid
    end
    it "Public can just be true or false" do
      recipe = Recipe.create(name: "tomato", user: @user, preparation_time: 15, cooking_time: 15,
                             description: "description 1", public: "yes")
      expect(recipe).not_to eq("yes")
    end
    describe "callbacks" do
      it "Should receive the recipe_foods length" do
        @food = Food.create(name: "Tomato", measurement_unit: "kg", price: 1.5, quantity: 10, user: @user)
        @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 2)
        expect(@recipe.total_food_items).to eq(1)
      end
    end
  end
end
