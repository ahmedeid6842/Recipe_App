class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods, foreign_key: 'recipe_id'
  has_many :foods, through: :recipe_foods, foreign_key: 'food_id'

  validates :name, :preparation_time, :cooking_time, :description, presence: true
  validates :public, inclusion: { in: [true, false] }
end
