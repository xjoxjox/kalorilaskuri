class CreateUserFatPersentageDevelopments < ActiveRecord::Migration
  def change
    create_table :user_fat_persentage_developments do |t|
      t.integer :user_id
      t.integer :fat_persentage

      t.timestamps null: false
    end
  end
end
