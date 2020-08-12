class Message < ApplicationRecord

belongs_to :user #1つのチャットルームに、メッセージは複数存在します。1人のユーザーは、複数のメッセージを送信できます
belongs_to :room #messagesテーブルに対して、roomsテーブルとusersテーブルは1対多の関係になります。
has_one_attached :image

validates :content, presence: true,unless: :was_attached? #空の場合はDBに保存しないというバリデーションを設定しています。
  def was_attached?
    self.image.attached?
  end

end
