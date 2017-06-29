# DB設計
---
## users table
---
|Column| Type |Options|
|:----:|:----:|:-----:|
|name|string|index :true, null false, unique true|

### Associaton
 - has_many :groups, through :members
 - has_many :messages
 - has_many :members


## groups table
---
|Column| Type |Options|
|:----:|:----:|:-----:|
|name|string|null false, unique true|


### Association
 - has_many :users ,through :members
 - has_many :messages

## members table
---
|Column  | Type  |Options              |
|:------:|:-----:|:-------------------:|
|group_id|integer|null false,foreign_key :true|
|user_id |integer|null false,foreign_key :true|

### Association
 - belongs_to :group
 - belongs_to :user

## messages
---
|Column  | Type  |Options|
|:----:  |:----: |:-----:|
|body    |text   |-|
|image   |string |-|
|group_id|integer|null false,foreign_key :true|
|user_id |integer|null false,foreign_key :true|

### Association
 - belongs_to :user
 - belongs_to :group
