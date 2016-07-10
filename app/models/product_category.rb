class ProductCategory < ActiveRecord::Base
  belongs_to :product
  belongs_to :category_for_product
end
