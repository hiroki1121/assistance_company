## consignment_side_usersテーブル

|Column              |Type     |Options                    |
|--------------------|---------|---------------------------|
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_ruby     | string  | null: false               |
| first_name_ruby    | string  | null: false               |
| company_name       | string  | null: false               |
| phone_number       | string  | null: false               |

### Association
- has_many :favorites
- has_many :posts, through: :favorites


## contracted_side_usersテーブル

|Column              |Type     |Options                    |
|--------------------|---------|---------------------------|
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_ruby     | string  | null: false               |
| first_name_ruby    | string  | null: false               |

### Association
- has_many :posts


## postsテーブル

|Column                  |Type        |Options                         |
|------------------------|------------|--------------------------------|
| industry_id            | integer    | null: false                    |
| company_name           | string     | null: false                    |
| company_url            | string     |                                |
| post_code              | string     | null: false                    |
| prefecture_id          | integer    | null: false                    |
| address                | string     | null: false                    |
| building_name          | string     |                                |
| employee_number        | integer    | null: false                    |
| division               | string     |                                |
| representative_name    | string     | null: false                    |
| email                  | string     | null: false                    |
| represent_phone_number | string     | null: false                    |
| direct_phone_number    | string     |                                |
| business_detail        | text       | null: false                    |
| contracted_side_user   | references | null: false, foreign_key: true |

### Association
- belongs_to :contracted_side_user
- has_many :favorites
- has_many :consignment_side_users, through: :favorites


## favoritesテーブル

|Column                 |Type        |Options                         |
|-----------------------|------------|--------------------------------|
| consignment_side_user | references | null: false, foreign_key: true |
| post                  | references | null: false, foreign_key: true |

### Association
- belongs_to :consignment_side_user
- belongs_to :post


## reviewsテーブル

|Column                 |Type        |Options                         |
|-----------------------|------------|--------------------------------|
| title                 | string     | null: false                    |
| comment               | text       | null: false                    |
| score                 | float      | null: false                    |
| consignment_side_user | references | null: false, foreign_key: true |
| post                  | references | null: false, foreign_key: true |

### Association
- belongs_to :consignment_side_user
- belongs_to :post