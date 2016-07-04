class MealProduct < ActiveRecord::Base
  belongs_to :meal
  belongs_to :product
end
