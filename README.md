# テーブル設計

## users テーブル

| Column             | Type    | Options     |
|--------------------|-------- |-------------|
| nickname           | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| date_of_birth      | date    | null: false |
| email              | string  | nill: false, unique: true |
| encrypted_password | string  | null: false |

### Association

- has_many :items
- has_many :records

## items テーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| name               | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| region_id          | integer    | null: false |
| number_of_days_id  | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## addresses テーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| post_code          | integer    | null: false |
| prefecture_id      | integer    | null: false |
| municipality       | string     | null: false |
| street_address     | string     | null: false |
| building_name      | string     |             |
| telephone_number   | string     | null: false |
| record             | references | null: false, foreign_key: true |

### Association

- belongs_to :record

## records テーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


