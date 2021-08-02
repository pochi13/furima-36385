# README

## users テーブル

| Column              | Type   | Options     　|
| ------------------  | ------ | ----------- 　|
| nickname            | string | null: false 　|
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false 　|
| last_name                | string | null: false 　|
| first_name                | string | null: false 　|
| last_name_kana           | string | null: false 　|
| first_name_kana           | string | null: false 　|
| birthday            | date | null: false |
### Association
has_many :purchases
has_many :items



## purchasesテーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| user                | reference | foreign_key:true |
| item                | reference | foreign_key:true |
### Association
belongs_to :user
belongs_to :item
has_one :address




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
| user                | reference | foreign_key:true |
### Association
belongs_to :user
has_one  :purchase





## address テーブル

| Column              | Type     | Options     |
| ------------------  | ------   | ----------- |
| code                | string   | null: false |
| delivery_area_id    | integer  | null: false |
| municipality        | string   | null: false |
| address             | string   | null: false |
| building            | string   |             |
| number              | string | null: false |
| purchase            | reference | foreign_key:true |
### Association
belongs_to :purchase










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
