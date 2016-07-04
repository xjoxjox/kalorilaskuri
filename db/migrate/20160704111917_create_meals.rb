class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.referer :user_id
      t.string :name
      t.string :description
      t.boolean :private

      t.timestamps null: false
    end
  end
end
