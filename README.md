# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル
 | Cloumn | Type | Options |
 | ------ | ---- | ------- |
 | nickname | string | null:false |
 | e-mail | string | null:false |
 | password | string | null:false,unique:true |
 | first_name | string | null:false |
 | last_name | string | null:false |
 | first_name_kana | string | null:false |
 | last_name_kana | string | null:false |
 | birthday | string | null:false |

### Association
 - has_one :credit_card
 - has_one :user_address
 - has_many :items

## user_addressテーブル
 | Cloumn | Type | Options |
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
 | user_id | string | null:false,foreign_key:true |

### Association
 - belongs_to :user

### credit_cardsテーブル
 | Cloumn | Type | Options |
 | ------ | ---- | ------- |
 | customer_id | string | null:false |
 | card_id | string | null:false |
 | user_id | string | null:false, foreign_key:true |

### Association
 - belongs_to :user

## itemsテーブル
 | Cloumn | Type | Options |
 | ------ | ---- | ------- |
 | name | string | null:false |
 | price | string | null:false |
 | describe | string | null:false |
 | condition | string | null:false |
 | shipping_charge | string | null:false |
 | prefecture | string | null:false |
 | delivery_date | string | null:false |
 | user_id | references | null:false, foreign_key:true |
 | category_id | references | null:false, foreign_key:true |
 | brand_id | references | null:false, foreign_key:true |

### Association
 - belongs_to :user
 - has_one :image
 - has_many :categorys
 - has_many :brands

## imagesテーブル
 | Cloumn | Type | Options |
 | ------ | ---- | ------- |
 | image | string |        |
 | item_id | references | foreign_key:ture |

### Association
 - has_many :items

## categorysテーブル
 | Cloumn | Type | Options |
 | ------ | ---- | ------- |
 | name | string |         |
 | ancestry | string |     |

### Association
 - belongs_to :item

## Brandsテーブル
 | Cloumn | Type | Options |
 | ------ | ---- | ------- |
 | name | string |         |

### Association
 - belongs_to :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
