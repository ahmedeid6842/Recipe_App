class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.all
    @current_user = current_user
  end

  def new
    @food = Food.new
  end
end
