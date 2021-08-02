# README

## users テーブル

| Column              | Type   | Options     　|
| ------------------  | ------ | ----------- 　|
| nickname            | string | null: false 　|
| email               | string | unique: true |
| encrypted_password  | string | null: false 　|
| last_name                | string | null: false 　|
| firstname                | string | null: false 　|
| last_name_kana           | string | null: false 　|
| first_name_kana           | string | null: false 　|
| birthday            | datetime | null: false |

has_many purchase
has_many items
belongs_to address


## purchasesテーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| user                | reference | foreign:true |
| item                | reference | foreign:true |

belongs_to user
has_many items
belomgs_to address




## items テーブル

| Column              | Type     | Options     |
| ------------------  | ------   | ----------- |
| name                | string   | null: false |
| explan              | text     | null: false |
| detail_category_id     | integer  | null: false |
| detail_status_id       | integer   | null: false |
| delivery_charge_id    | integer   | null: false |
| delivery_area_id       | integer   | null: false |
| delivery_indication_id | integer   | null: false |
| price               | integer | null: false |
| user                | reference | foreign:true |

belongs_to user
has_many   purchase
belongs_to address




## address テーブル

| Column              | Type     | Options     |
| ------------------  | ------   | ----------- |
| code                | string   | null: false |
| delivery_area_id    | integer  | null: false |
| municipalities      | string   | null: false |
| address             | string   | null: false |
| building            | string   |            |
| number              | insteger | null: false |
| purchase            | reference | foreign:true |


belongs_to purchase








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
