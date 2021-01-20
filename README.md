# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| email          | string | null: false |
| password       | string | null: false |
| password       | string | null: false |
| first_name     | string | null: false |
| second_name    | string | null: false |
| birthday_year  | string | null: false |
| birthday_month | string | null: false |
| birthday_day   | string | null: false |

has_many :item
has_many :purchases


## items テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| image        |            |             |
| product_name | text       | null: false |
| product_text | text       | null: false |
| category     | string     | null: false |
| state        | string     | null: false |
| burden       | string     | null: false |
| area         | string     | null: false |
| shiping      | string     | null: false |
| price        | string     | null: false |
| user         | references |             |

belongs_to :user 
has_one :purchases

## purchases テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| card_name       | string     | null: false |
| card_number     | string     | null: false |
| security_number | string     | null: false |
| post_number     | string     | null: false |
| prefecture      | string     | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| phone_number    | string     | null: false |
| buy_price       | string     | null: false |
| user            | references |             |
| item            | references |             |

belongs_to :user 
belongs_to :item 