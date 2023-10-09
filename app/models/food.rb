class Food < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipes, foreign_key: :food_id

  validates :name, :measurement_unit, :price, :quantity, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
