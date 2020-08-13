require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do
    before do
      @room = FactoryBot.build(:room)
    end

    it "nameの値が存在すれば登録できること" do
      expect(@room).to be_valid
      #チャットルームの情報が正しく保存されるか確認しています。
    end
    it "nameが空では登録できないこと" do
      @room.name = nil
      @room.valid?

      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
  end

end
