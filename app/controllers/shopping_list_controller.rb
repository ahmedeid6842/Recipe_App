class ShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @food = @recipe.foods
    @total_price = sum(@recipe_foods)
  end

  private

  def sum(array)
    sum = 0
    array.each do |number|
      sum += number.quantity * number.food.price
    end

    sum.round(2)
  end
end
