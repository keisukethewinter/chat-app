class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end #updateアクション内で、保存できた場合とできなかった場合で条件分岐の処理を行います。
   # current_user.updateに成功した場合、root（チャット画面）にリダイレクトします。
   # 失敗した場合、render :editとeditのアクションを指定しているため、editのビューが表示されます。
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)
  end #Userモデルの更新を行うupdateアクションをusersコントローラーに定義しましょう。
  # ストロングパラメーターを使用し、user_paramsを定義します。
  # user_paramsの中でpermitメソッドを使用し、「name」と「email」の編集を許可します。
  # そして、ユーザー情報が格納されているcurrent_userメソッドを使用して、ログインしているユーザーの情報を更新します。

end
