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

## goodsテーブル

|Column|Type|Options|
|------|----|-------|
|good_name|string|null: false|
|price|integer|null: false|
|status|string|null: false|
|description|string|null: false|
|shipping_charge|string|null: false|
|shipping_area|string|null: false|
|days_to_ship|string|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: ture|
|brand_id|integer|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images
- has_many :purchase_histories


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|furigana|string|null: false|
|brithday|integer|null: false|
|street_address_id|integer|

### Association
- belongs_to :street_address
- has_many :credit_cards
- has_many :purchase_histories
- has_many :goods


## street_addressesテーブル

|Column|Type|Optoins|
|------|----|-------|
|address_family_name|string|null: false|
|address_first_name|string|null: false|
|furigana|string|null: false|
|address_number|integer|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building|string|
|phone_number|integer|

### Association
- has_many :users


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|owner_name|string|null: false|
|expiration_date|integer|null: false|
|card_type|string|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|good_image|text|null: false|
|good_id|references|null: false, foreign_key: true|

### Association
- belongs_to :good


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|genre1|string|
|genre2|string|
|genre3|string|

### Association
- has_many :goods


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand_name|string|

### Association
- has_many :goods


## purchase_historiesテーブル

|Column|Type|Options|
|------|----|-------|
|purchase_date|datetime|null: false|
|user_id|references|null: false, foreign_key: true|
|good_id|integer|

### Association
- belongs_to :user
- has_many :goods