## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| email              | string | null: false,unique: true|
| encrypted_password | string | null: false             |
| name               | string | null: false             |


### Association

- has_many :comments
- has_many :cosmes

## cosmes テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| text         | text       | null: false                   |
| title        | strings    | null: false                   |
| user         | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## comments テーブル

| Column      | Type      | Options                       |
| ----------- | --------- | ----------------------------- |
| text        | text      | null: false                   |
| user        | references| null: false,foreign_key: true |
| cosme       | references| null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :cosme

