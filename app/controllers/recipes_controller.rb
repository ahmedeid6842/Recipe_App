class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_by_id

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = @user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
    else
      flash[:alert] = 'Error! Recipe not created'
      redirect_to new_recipe_path
    end
  end

  def destroy
    @recipe = @user.recipes.find_by(id: params[:id])
    if @recipe.destroy
      flash[:notice] = 'Recipe deleted successfully'
    else
      flash[:alert] = 'Error! Recipe not deleted'
    end
    redirect_to recipes_path
  end

  def update
    @recipe = @user.recipes.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = 'Recipe updated successfully'
    else
      flash[:alert] = 'Error! Recipe not updated'
    end
    redirect_to @recipe
  end

  private

  def find_user_by_id
    @user = current_user
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Error! User not found'
    redirect_to users_url
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :preparation_time, :public)
  end
end
