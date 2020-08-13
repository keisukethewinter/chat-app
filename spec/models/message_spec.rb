require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
      @message.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@message).to be_valid
      #contentとimageの両方が存在していれば、DBに正しく保存されるかを確認しています。
    end
    it 'contentが存在していれば保存できること' do
      @message.image = nil
      expect(@message).to be_valid
      #contentが存在していれば、DBに正しく保存されるかを確認しています。
    end
    it 'imageが存在していれば保存できること' do
      @message.content = nil
      expect(@message).to be_valid
    end
    it 'contentとimageが空では保存できないこと' do
      @message.content = nil
      @message.image = nil
      @message.valid?
      #モデルファイルで設定したバリデーション（もしcontentとimageが空だったらDBに保存されない）が正常に起動するかを確認しています。
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end
  end

end
