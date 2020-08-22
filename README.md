# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル
 | Column | Type | Options |
 | ------ | ---- | ------- |
 | nickname | string | null:false |
 | e-mail | string | null:false,unique:true |
 | password | string | null:false |
 | first_name | string | null:false |
 | last_name | string | null:false |
 | first_name_kana | string | null:false |
 | last_name_kana | string | null:false |
 | birthday | date | null:false |

### Association
 - has_one :credit_card
 - has_one :user_address
 - has_many :items

## user_addressテーブル
 | Column | Type | Options |
 | ------ | ---- | ------- |
 | first_name | string | null:false |
 | last_name | string | null:false |
 | first_name_kana | string | null:false |
 | last_name_kana | string | null:false |
 | postal_code | string | null:false |
 | prefecture | string | null:false |
 | city | string | null:false |
 | address | string | null:false |
 | building | string |         |
 | phone_number | string |     |
 | user_id | references | null:false,foreign_key:true |

### Association
 - belongs_to :user

### credit_cardsテーブル
 | Column | Type | Options |
 | ------ | ---- | ------- |
 | customer_id | string | null:false |
 | card_id | string | null:false |
 | user_id | references | null:false, foreign_key:true |

### Association
 - belongs_to :user

## itemsテーブル
 | Column | Type | Options |
 | ------ | ---- | ------- |
 | name | string | null:false |
 | price | integer | null:false |
 | describe | text | null:false |
 | condition | string | null:false |
 | shipping_charge | string | null:false |
 | prefecture | string | null:false |
 | delivery_date | string | null:false |
 | user_id | references | null:false, foreign_key:true |
 | category_id | references | null:false, foreign_key:true |
 | brand_id | references | foreign_key:true |

### Association
 - belongs_to :user
 - has_many :images
 - belongs_to :category
 - belongs_to :brand

## imagesテーブル
 | Column | Type | Options |
 | ------ | ---- | ------- |
 | image | string | null:false |
 | item_id | references | null:false, foreign_key:true |

### Association
 - belongs_to :item

## categoriesテーブル
 | Column | Type | Options |
 | ------ | ---- | ------- |
 | name | string | null:false |
 | ancestry | string |     |

### Association
 - has_many :items

## brandsテーブル
 | Column | Type | Options |
 | ------ | ---- | ------- |
 | name | string | null:false |

### Association
 - has_many :items

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
