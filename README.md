# README


## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | NOT NULL, unique: true |
| encrypted_password | string | NOT NULL |
| name               | string | NOT NULL |
| profile            | text | NOT NULL |
| occupation         | text | NOT NULL |
| position           | text | NOT NULL |

## prototypesテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| title              | string | NOT NULL |
| catch_copy         | text | NOT NULL |
| concept            | text | NOT NULL |
| user               | references | NOT NULL, foreign_key: true |

## commentsテーブル

| content            | text | NOT NULL |
| prototype          | references | NOT NULL, foreign_key: true |
| user               | references | NOT NULL, foreign_key: true |
