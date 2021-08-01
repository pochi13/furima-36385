# README

## users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| name(em)            | string | null: false |
| name(en)            | string | null: false |
| birthday            | string | null: false |

## purchasesテーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| name                | string | null: false |
| category            | string | null: false |
| status              | string | null: false |
| derivery            | string | null: false |
| indication          | string | null: false |



## items テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| image               |        | null: false |
| name                | string | null: false |
| explan              | text   | null: false |
| detail              | text   | null: false |
| delivery            | string | null: false |
| price               | string | null: false |


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
