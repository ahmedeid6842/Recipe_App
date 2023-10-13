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
      puts @recipe_food.errors.full_messages
      redirect_to new_recipe_food_path(recipe_id: @recipe.id)
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = @recipe_food.recipe
    if @recipe_food.destroy
      flash[:notice] = 'Recipe food deleted successfully'
    else
      flash[:alert] = 'Error! Recipe food not deleted'
    end
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = @recipe_food.recipe
    @foods = Food.all
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = @recipe_food.recipe
    if @recipe_food.update(recipe_food_params)
      flash[:notice] = 'Recipe food updated successfully'
    else
      flash[:alert] = 'Error! Recipe food not updated'
    end
    redirect_to recipe_path(@recipe)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :recipe_id, :quantity)
  end
end
