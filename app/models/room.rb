class Room < ApplicationRecord
  has_many :room_users
  has_many :users,through: :room_users,dependent: :destroy
  has_many :messages, dependent: :destroy #1つのチャットルームに、メッセージは複数存在します。
  #つまり、roomsテーブルに対して、messagesテーブルは、1対多の関係になります。

  validates :name, presence: true #チャットルームを新規作成するにあたって「ルーム名」は必ず必要なので、上記のバリデーションは「ルーム名が存在（presence）している場合のみ作成可（true）」という意味です。
end
