require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録出来ること" do
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
       #モデルファイルで設定したバリデーション（もしuserのnameが空だったらDBに保存されない）が正常に起動するかを確認しています。
      expect(@user.errors.full_messages).to include("Name can't be blank")
       #もしDBに保存されない場合のエラーメッセージは、「Name can't be blank（nameを入力してください）」となります。
    end

    it "emailがからでは登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      #注目すべきはここで「@user.password_confirmation = nil」としてしまうと、不一致が生じます。
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123456"
      #123456は、今回の条件に合うように仮置きの値として指定した文字列です
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
      #データベースに保存されるかを確認しています。
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation ="12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      #ここでは、user情報をデータベースに保存する記述をしています。
      another_user = FactoryBot.build(:user,email: @user.email)
      #ここでは、FactoryBotを用いて、user情報（name、email、password、password_confirmation）の中でも「email」だけを選択してインスタンスを生成しています。
#そして、生成したインスタンスを「another_user」に代入しています。
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end




  end
end
