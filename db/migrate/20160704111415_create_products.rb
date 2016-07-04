class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :producer
      t.float :fat
      t.float :carbohydrate
      t.float :protein
      t.float :sugar
      t.integer :weight

      t.timestamps null: false
    end
  end
end
