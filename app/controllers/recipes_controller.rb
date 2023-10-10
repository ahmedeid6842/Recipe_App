class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_by_id

  def show; end

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

  def find_user_by_id
    @user = current_user
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Error! User not found'
    redirect_to users_url
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :preparation_time, :public)
  end
end
