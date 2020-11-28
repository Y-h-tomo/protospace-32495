# ProtoSpace の テーブル構成

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column     | Type                 | Options                        |
| ---------- | -------------------- | ------------------------------ |
| title      | string               | null: false                    |
| catch_copy | text                 | null: false                    |
| concept    | text                 | null: false                    |
| image      | ActiveStorage で実装 |
| user       | references           | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| prototypes | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype

# ProtoSpace 　の　 ER 図

![ProtoSpace　の　ER図 ](public/proto.png)