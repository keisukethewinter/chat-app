class RoomsController < ApplicationController

  def index
  end
  
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new #うまく行かなかった場合はrenderでrooms/new.html.erbにページを戻しています。
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end
  #どのをチャットルームを削除するのかを特定する場合は、Room.find.params[:id]を使用して、削除したいチャットルームの情報を取得します。
# destroyアクションは、削除するだけなのでビューの表示は必要はありません。
# そのため、インスタンス変数ではなく変数としてroomを定義し、destroyメソッドを使用します。
# destroyメソッドが実行されたら、root（roomsのindex）にリダイレクトする記述をします。


  private
  def room_params
    params.require(:room).permit(:name, user_ids:[])#配列に対して保存を許可したい場合は、キーの名称と関連づけてバリューに「[]」と記述します。
  end
end