class RecipeFoodsController < ApplicationController
  def show; end

  def index; end

  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = current_user.foods
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe = @recipe_food.recipe
    if @recipe_food.save
      flash[:notice] = 'Recipe food created successfully'
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = 'Error! Recipe food not created'
      puts @recipe_food.errors.full_messages # Agregar esta línea para ver los errores de validación en la consola
      redirect_to new_recipe_food_path(recipe_id: @recipe.id)
    end
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :recipe_id, :quantity)
  end
end
