class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string     :comment
      t.float      :score, null: false
      t.references :consignment_side_user, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
