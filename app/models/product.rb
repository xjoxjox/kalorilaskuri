class Product < ActiveRecord::Base
  has_many :product_categories
  has_many :category_for_products, through: :product_categories

  validates :calories, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000 }
  validates :fat, :sugar, :carbohydrate, :protein, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5000 }
  validates :name, length: { in: 1..30 }

end
