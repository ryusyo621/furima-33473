# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| huri_first_name    | string | null: false |
| huri_last_name     | string | null: false |
| birthday           | date   | null: false |

has_many :items
has_many :purchases
has_many :deriveries



## items テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| product_name | string     | null: false       |
| product_text | text       | null: false       |
| category_id  | integer    | null: false       |
| state_id     | integer    | null: false       |
| burden_id    | integer    | null: false       |
| area_id      | integer    | null: false       |
| shiping_id   | integer    | null: false       |
| price        | integer    | null: false       |
| user         | references | foreign_key: true |

belongs_to :user 
has_one :purchases

## purchases テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| buy_price | integer     | null: false       |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

belongs_to :user 
belongs_to :item 

## deliveries テーブル
| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| post_number  | integer    | null: false       |
| prefecture   | string     | null: false       |
| city         | string     | null: false       |
| address      | string     | null: false       |
| building     | string     |                   |
| phone_number | integer    | null: false       |
| user         | references | foreign_key: true |
| purchase     | references | foreign_key: true |

