class AddColumsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :weight, :float
    add_column :users, :height, :integer
    add_column :users, :fat_percentage, :integer
  end
end
