class CreateUserWeightDevelopments < ActiveRecord::Migration
  def change
    create_table :user_weight_developments do |t|
      t.integer :user_id
      t.float :weight

      t.timestamps null: false
    end
  end
end
