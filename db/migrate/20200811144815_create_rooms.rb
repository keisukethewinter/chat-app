class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false #roomsテーブルには「room名のみ」を保存するので、上記のようなコードとなります。
      t.timestamps
    end
  end
end
