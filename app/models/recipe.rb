class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy
  has_many :foods, through: :recipe_foods, foreign_key: 'food_id'

  validates :name, :preparation_time, :cooking_time, :description, presence: true
  validates :public, inclusion: { in: [true, false] }

  def total_food_items
    recipe_foods.length
  end

  def total_price
    recipe_foods.reduce(0) { |sum, recipe_food| sum + (recipe_food.quantity * recipe_food.food.price) }
  end
end
