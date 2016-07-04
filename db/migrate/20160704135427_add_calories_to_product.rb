class AddCaloriesToProduct < ActiveRecord::Migration
  def change
    add_column :products, :calories, :integer
  end
end
