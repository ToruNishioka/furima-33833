# テーブル設計

## usersテーブル

| Column     | Type    | Option                    |
| ---------- | ------- | ------------------------- |
| nickname   | string  | null: false, unique: true |
| email      | string  | null: false, unique: true |
| password   | string  | null: false               |
| last_name  | string  | null: false               |
| first_name | string  | null: false               |
| birthday   | integer | null: false               |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| description     | text       |                                |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| area            | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| title           | references | null: false, foreign_key: true |
| category        | references | null: false, foreign_key: true |
| status          | references | null: false, foreign_key: true |
| delivery_charge | references | null: false, foreign_key: true |
| area            | references | null: false, foreign_key: true |
| days_to_ship    | references | null: false, foreign_key: true |
| price           | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :shipping_address