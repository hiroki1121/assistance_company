class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :consignment_side_user, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
    add_index :favorites, [:consignment_side_user_id, :post_id], unique: :true
  end
end
