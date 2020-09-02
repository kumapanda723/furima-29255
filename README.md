# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| id       | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| product  | string     | null: false                    |
| category | string     | null: false                    |
| price    | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |
| price   | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| address_line | string     |                                |
| city         | references | null: false, foreign_key: true |
| prefecture   | references | null: false, foreign_key: true |
| country      | references | null: false, foreign_key: true |
| postal_code  | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :order