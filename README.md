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
- has_one :record

## items テーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| name               | string     | null: false |
| description        | text       | null: false |
| category           | string     | null: false |
| condition          | string     | null: false |
| delivery_charge    | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address
- has_one :record

## addresses テーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| post_code          | integer    | null: false |
| prefecture         | string     | null: false |
| municipality       | string     | null: false |
| street_address     | integer    | null: false |
| building_name      | string     |             |
| telephone_number   | integer    | null: false |

### Association

- has_many :items
- has_one :record

## records テーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address


