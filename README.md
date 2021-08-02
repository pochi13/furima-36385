# README

## users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| name                | string | null: false |
| name_kana           | string | null: false |
| birthday            | datetime | null: false |

has_one purchase
has_many items
belongs_to address


## purchasesテーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| name                | string | null: false |
| category            | string | null: false |
| status              | string | null: false |
| derivery            | string | null: false |
| indication          | string | null: false |

belongs_to user
has_many items
belomgs_to address




## items テーブル

| Column              | Type     | Options     |
| ------------------  | ------   | ----------- |
| name                | string   | null: false |
| explan              | text     | null: false |
| detail_category     | string   | null: false |
| detail_status       | string   | null: false |
| delivery_charge     | string   | null: false |
| delivery_area       | string   | null: false |
| delivery_indication | string   | null: false |
| price               | insteger | null: false |

belongs_to user
belongs_to purchase
belongs_to address




## address テーブル

| Column              | Type     | Options     |
| ------------------  | ------   | ----------- |
| code                | insteger | null: false |
| prefectures         | string   | null: false |
| municipalities      | string   | null: false |
| address             | string   | null: false |
| building            | string   | null: false |
| number              | insteger | null: false |

has_many users
has_many purchases
has_many items








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
