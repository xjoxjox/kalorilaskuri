class CreateMealProducts < ActiveRecord::Migration
  def change
    create_table :meal_products do |t|
      t.references :meal, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
