class Meal < ActiveRecord::Base
  belongs_to :user
  has_many :products, through: :meal_products
end
