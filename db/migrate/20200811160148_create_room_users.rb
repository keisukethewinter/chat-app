class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, foreign_key: true #この「room_usersテーブル」は中間テーブルなので、どのユーザーがどのチャットルームに参加しているを管理しています。
      # つまり、ここに保存する「ユーザー」と「チャットグループ」は必ず存在している事が前提なので、「usersテーブル」と「roomsテーブル」の情報を参照する必要があります。
      # この参照する役割を果たすのが「foreign_key: true」です。
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
