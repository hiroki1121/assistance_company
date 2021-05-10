class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :industry_id, null: false
      t.string :company_name, null: false
      t.string :company_url
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :address, null: false
      t.string :building_name
      t.integer :employee_number, null: false
      t.string :division
      t.string :representative_name, null: false
      t.string :email, null: false
      t.string :represent_phone_number, null: false
      t.string :direct_phone_number
      t.text :business_detail, null: false
      t.references :contracted_side_user, foreign_key: true
      t.timestamps
    end
  end
end
