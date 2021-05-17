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
- has_many :purchase_managements

## sipping_addresses テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| city                | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| postal_code         | string     | null: false                    |
| phone_number        | string     | null: false                    |
| purchase_management | references | null: false, foreign_key: true |

### アソシエーション
- belongs_to :purchase_management

## purchase_managements テーブル

| Column           | Type   | Options                            |
| ---------------- | ------ | -----------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### アソシエーション
- belongs_to :user
- belongs_to :item
- has_one :sipping_address



## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| sipping_cost_id  | integer    | null: false                    |
| sipping_day_id   | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |

### アソシエーション
- has_one :purchase_management
- belongs_to :user

