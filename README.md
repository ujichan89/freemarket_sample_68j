## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
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
|birthday|integer|null: false|

### Association
- belongs_to :street_address
- has_many :credit_cards
- has_many :purchase_histories
- has_many :items


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
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


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
|item_image|text|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|genre|string|

### Association
- has_many :items
- has_ancestry


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand_name|string|

### Association
- has_many :items


## purchase_historiesテーブル

|Column|Type|Options|
|------|----|-------|
|purchase_date|datetime|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|integer|

### Association
- belongs_to :user
- has_many :items