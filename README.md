# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| Column    | Type   | Option                    |
| -------   | ------ | ------------------------- |
| user_name | string | null: false, unique: true |
| email     | string | null: false, unique: true |
| password  | string | null: false               |
| address   | string | null: false               |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| category    | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| description | text       |                                |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |
| address     | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_addresse

## shipping_addressesテーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| house_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :shipping_addresse