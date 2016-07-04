class CreateMealProducts < ActiveRecord::Migration
  def change
    create_table :meal_products do |t|
      t.referer :meal_id
      t.referer :product_id

      t.timestamps null: false
    end
  end
end
