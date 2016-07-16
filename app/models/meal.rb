class Meal < ActiveRecord::Base
  belongs_to :user
  has_many :meal_products
  has_many :products, through: :meal_products
  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
end
