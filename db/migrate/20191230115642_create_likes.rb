class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user_id,null: false
      t.references :item_id,null: false
      t.timestamps
    end
  end
end
