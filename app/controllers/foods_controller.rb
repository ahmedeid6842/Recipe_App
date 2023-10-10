class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.all
    @current_user = current_user
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)

    if @food.valid? && @food.save
      flash[:success] = "Food has been added successfully"
      redirect_to foods_path
    else
      Rails.logger.error("Failed to create food: #{@food.errors.full_messages}")
      render :new
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
