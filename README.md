# 1.アプリケーション名
## Assistance Company
<img width="40%" src="public/app-img.png">

# 2.アプリケーション概要
本アプリケーションは、協力会社検索サイトとなっております。外注先を探している方や、自社の情報を発信したい方に向けたサイトとなっております。本サイトは委託側と受託側でユーザーが分かれており、委託側は、会社を検索、お気に入り、レビューを行うことができます。受託側は、会社を投稿、編集、削除、検索を行うことができます。

# 3.URL


# 4. ID/Pass
## 【BASIC認証】
- ID：
- password：
## 【テスト用アカウント】
委託側(consignment_side_users)
- ID：
- password：

受託側(contracted_side_users)
- ID：
- password：
# 5.利用方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。<br>※ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
# 6.目指した課題解決
## 【経緯】
私は前職で設計会社に勤めており、殆どの業務において協力会社に仕事を外注してました。外注先は、技術力の高い会社である必要があったため、常に固定化されている状況にありました。そのため、いつも委託している外注先が手一杯の時に頼める会社が他にないという課題がありました。そういった課題を解決するため、会社を検索できるアプリケーションの作成を行いました。

## 【ペルソナ】
- 性別と年齢：20代〜40代（男女）
- 職業：（会社員及び個人事業主）
# 7.要件定義



# 8.実装した機能について
## 【ER図】
<img width="50%" src="public/er_diagram.png">

## 【ユーザー管理機能】
- ユーザー管理機能は、ペルソナが委託側と受託側に分かれるため、deviseを用いて、委託側(consignment_side_users)と受託側(contracted_side_users)の実装を行いました。
- 委託側(consignment_side_users)は、検索やお気に入り、レビューを行うことができます。
- 受託側(contracted_side_users)は会社投稿、編集、削除、検索を行うことができますが、お気に入り、レビューを行うことはできません。新規登録については、一つの会社から部署毎に複数の投稿を行うことを想定し、入力フォームは最小限の情報としています。
## 【会社投稿機能】
- 会社投稿機能は、一つの会社から部署毎に複数の投稿を行うことを想定して何度も投稿できるようにしています。また、規模が小さい会社や個人事業主も投稿することを想定し、URLや建物名、部署、電話番号（直通）は任意入力としています。
## 【会社一覧表示機能】
- トップページに、投稿新着順に20社のみ、会社概要を表示できるようにしています。これは、検索を行うことを前提としているためです。
## 【会社投稿詳細表示機能】
- 会社一覧表示をクリックすると、会社詳細ページへ遷移します。ここには、登録されている全ての情報と星レビュー機能の平均点が表示されています。
- 星レビュー平均点をクリックするとレビュー一覧ページへ、URLをクリックすると該当ページへ遷移します。
## 【会社投稿編集・削除機能】
- 受託側(contracted_side_users)のみ自ら投稿した情報を編集、削除することができます。
## 【会社検索機能】
- 業種、都道府県、キーワードにより絞り込み検索を行うことができます。※未入力の場合には、全ての会社が表示される（検索のため、制限なし）。
- 検索ボタン横のマイクボタンを押すと、音声入力を行うことができます。※Web Speech APIを利用
## 【お気に入り機能】
- 委託側(consignment_side_users)は会社詳細ページより、お気に入り登録、削除を行うことができます。登録したお気に入りは、マイページ（ヘッダーのユーザー名をクリック）で確認、削除することができます。
## 【星レビュー機能】
- 委託側(consignment_side_users)は会社詳細ページより、レビューを行うことができます。レビュー先が会社ということで、一定の評価を担保するため、星0は選択出来ないようにしています。
- 投稿したレビューは、編集、削除を行うことができます。
# 9. DB設計

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