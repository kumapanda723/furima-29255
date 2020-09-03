# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| birthday | string | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| product       | string     | null: false                    |
| picture       | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| price         | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| prefecture    | references | null: false, foreign_key: true |
| shipping_date | string     | null: false                    |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |
| price   | references | null: false, foreign_key: true |
| card    | string     | null: false                    |

### Association

- belongs_to :user
- has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| phone        | string     | null: false                    |
| building     | string     |                                |
| address_line | string     | null: false                    |
| city         | string     | null: false                    |
| prefecture   | string     | null: false                    |
| postal_code  | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :order