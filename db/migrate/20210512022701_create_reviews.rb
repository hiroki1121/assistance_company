class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string     :title, null: false
      t.text       :comment, null: false
      t.float      :score, null: false
      t.references :consignment_side_user, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
