class Message < ApplicationRecord

belongs_to :user #1つのチャットルームに、メッセージは複数存在します。1人のユーザーは、複数のメッセージを送信できます
belongs_to :room #messagesテーブルに対して、roomsテーブルとusersテーブルは1対多の関係になります。

validates :content, presence: true #空の場合はDBに保存しないというバリデーションを設定しています。
end
