# DB設計

## users table

  |Column       |Type      |Options                   |
  |:-----------:|:--------:|:------------------------:|
  |name         |string    |null: false, unique: true , add_index|
  |company      |string    |null: false               |
  |position     |string    |                          |
  |infomation   |text      |                          |
  |Email        |string    |null: false, unique: true |
  |face         |image     |                          |
  |password     |string    |null:false                |
  |timestamps   |timestamps|                          |

## Association  

  - has_many :articles, through: :user_article
  - has_many :picks
  - has_many :user_article

*****



## articles table  

  |Column       |Type         |Options                   |
  |:-----------:|:-----------:|:------------------------:|
  |title        |string       |                          |
  |image        |string       |                          |
  |source       |string       |                          |
  |timestamps   |timestamps   |                          |

## Association  

  - has_many :users, through: :user_article
  - has_many :picks
  - has_many :user_article

*****



## users_articles table  

  |Column       |Type         |Options                   |
  |:-----------:|:-----------:|:------------------------:|
  |user_id      |references   |ON UPDATE CASCADE ON DELETE CASCADE|
  |chatgroup_id |references   |ON UPDATE CASCADE ON DELETE CASCADE|


## Association  

  - belongs_to :user
  - belongs_to :article

*****



## follows table  

  |Column       |Type         |Options                   |
  |:-----------:|:-----------:|:------------------------:|
  |user_id      |string       |                          |
  |follow_id    |string       |                          |
  |timestamps   |timestamps   |                          |

## Association  

  - belongs_to :user


## picks table

  |Column       |Type         |Options                   |
  |:-----------:|:-----------:|:------------------------:|
  |user_id      |string       |ON UPDATE CASCADE ON DELETE CASCADE|
  |article_id   |string       |ON UPDATE CASCADE ON DELETE CASCADE|
  |timestamps   |timestamps   |                          |

## Association  

  - belongs_to :user
  - belongs_to :article
  - has_one :comment



## comments table

  |Column       |Type         |Options                   |
  |:-----------:|:-----------:|:------------------------:|
  |coment       |text         |                          |
  |pick_id      |string       |ON UPDATE CASCADE ON DELETE CASCADE|

## Association  

  - belongs_to :pick



## likes table

  |Column       |Type         |Options                   |
  |:-----------:|:-----------:|:------------------------:|
  |coment_id    |string       |ON UPDATE CASCADE ON DELETE CASCADE|
  |user_id      |string       |ON UPDATE CASCADE ON DELETE CASCADE|
  |like         |boolean      |                          |
  |timestamps   |timestamps   |                          |


  - belongs_to :user
  - belongs_to :picks
