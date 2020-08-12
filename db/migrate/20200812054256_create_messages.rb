class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :room, foreign_key: true #メッセージの投稿をしたチャットルームのid：「room_id」カラム
      t.references :user, foreign_key: true #メッセージの投稿をしたユーザーのid：「user_id」カラム
      #外部キー制約です。roomとuserには、foreign_key: trueの制約をつけましょう。こちらの制約は外部キー（今回であればroom_idとuser_id）の存在をDBに保存する上での必須条件とすることができます。
# もし、この制約をつけなかった場合、関連性を持つテーブルのレコードに意図しない値が保存されてしまう可能性があり、エラーが発生します。
      t.timestamps
    end
  end
end
