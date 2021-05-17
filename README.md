# README

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| last_name        | string | null: false |
| family_name_kana | string | null: false |
| birth_day        | date   | null: false |

### アソシエーション
- has_many :buyers
- has_one :card
- has_one :buyer

## buyers テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| address          | string | null: false                    |
| building_name    | string | null: false                    |
| city             | string | null: false                    |
| state            | string | null: false                    |
| postal_code      | string | null: false                    |
| phone_number     | string | null: false                    |
| user_id          | integer| null: false, foreign_key: true |

### アソシエーション
- belongs_to :user


## cards テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | integer    | null: false, foreign_key: true |
| customer_id      | references | null: false, foreign_key: true |
| card_id          | references | null: false, foreign_key: true |

### アソシエーション
- belongs_to :user

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| condition        | string     | null: false                    |
| sipping_cost     | integer    | null: false                    |
| sipping_area     | string     | null: false                    |
| sipping_days     | integer    | null: false                    |
| prefecture_id    | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |
| category_id      | references | null: false, foreign_key: true |
| item_status_id   | references | null: false, foreign_key: true |

### アソシエーション
- has_many :images
- belongs_to :category
- belongs_to :user

## categories テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| name             | string | null: false                    |

### アソシエーション
- has_many :items

## images テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| item_id          | references | null: false, foreign_key: true |

### アソシエーション
- belongs_to :item