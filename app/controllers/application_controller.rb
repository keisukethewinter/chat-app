class ApplicationController < ActionController::Base
  before_action :authenticate_user! #この記述により、ログインしていないユーザーをサインアップの画面に促すことができます。
  before_action :configure_permitted_parameters, if: :devise_controller? #Railsでは、悪意のあるユーザーの入力に対してセキュリティ対策を行わないと保存できない仕組みがあります。
  # 通常のテーブルに保存する際はストロングパラメータを使用しましたが、deviseを使ったモデルの場合は方法が異なります。  
  # application_controllerにbefore_actionを使用しているため、全てのアクションが実行される前に、 before_action :configure_permitted_parameters, if: :devise_controller?が実行されることになります。
  # deviseのコントローラーから呼び出された場合は、configure_permitted_parametersメソッドが呼ばれます。

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end #ここでconfigure_permitted_parametersメソッドの定義を行なっています。
  #deviseをインストールすることでdevise_parameter_sanitizerメソッドが使えるようになります。deviseでユーザー登録をする場合に使用でき、「特定のカラムを許容する」メソッドです。
  #今回は「nameカラム」を追加したので、このメソッドを使用し、「name」キーの内容の保存をpermitメソッドで許可しています。





end
