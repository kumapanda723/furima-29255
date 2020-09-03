# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_ruby | string | null: false |
| first_name_ruby  | string | null: false |
| birthday         | date   | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| item             | string     | null: false                    |
| detail           | text       |                                |
| user             | references | null: false, foreign_key: true |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| price            | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_date

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| phone        | integer    | null: false                    |
| building     | string     |                                |
| address_line | string     | null: false                    |
| city         | string     | null: false                    |
| postal_code  | integer    | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order