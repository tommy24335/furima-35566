# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| last_name          | string | null: false               |
| family_name_kana   | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_day          | date   | null: false               |

### アソシエーション
- has_many :items

## sipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| city             | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| postal_code      | string     | null: false                    |
| phone_number     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### アソシエーション
- has_one :purchase_management

## purchase_managements テーブル

| Column           | Type   | Options                            |
| ---------------- | ------ | -----------------------------------|
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### アソシエーション
- belongs_to :item
- belongs_to :sipping_addresses



## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| sipping_cost_id  | integer    | null: false                    |
| sipping_area_id  | integer    | null: false                    |
| sipping_days_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |

### アソシエーション
- has_one :purchase_management
- belongs_to :user

