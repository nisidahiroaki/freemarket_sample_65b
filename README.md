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



#フォークテスト


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e-mail|string|null: false, unique: true|
|password|string|null: false|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|mobile_phone_number|string|null: false, unique: true|
|profile_comment|text||
|postal_code|string||
|prefecture|string||
|city|string||
|address_number|string||
|building_name|string||

### Association
- has_many :items
- has_many :cards
- has_many :addresses
- has_many :comments
- has_many :likes
- has_many :evaluations
- has_many :sns_credentials


## user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name_kanji|string||
|first_name_kanji|string||
|family_name_kana|string||
|first_name_kana|string||
|postal_code|integer||
|prefecture|string||
|city|string||
|address_number|string||
|building_name|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|user_id|references|null: false, foreign_key: true|
|description|text|
|category|integer|null: false|
|condition|itenger|null: false|
|delivery_fee|integer|null: false|
|delivery_method|integer|null: false|
|shipping_area|integer|null: false|
|shipping_days |integer|null: false|
|price|integer|null: false|
|brand|integer|
|buyer|integer|null: false|


### Association
- belongs_to :user
- has_many :photos
- has_many comments
- has_many :likes


## photosテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|expiration_date_month|integer|null: false|
|expiration_date_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|comment|text||

### Association
- belongs_to :user
- belongs_to :item



## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item



## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|integer||
|user_id|references|null: false, foreign_key: true|
|comment|text||

### Association
- belongs_to :user



## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|uid|integer|null: false|
|provider|string|null: false|
|token|text||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|

### Association
- has_many :item_categories
- has_many :items, through: :item_categories


## item_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|foreign_key: true|
|category|references|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category


##  brandsテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|foreign_key: true|
|brandname|string|

### Association
- belongs_to :item