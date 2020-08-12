class RoomsController < ApplicationController

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




  private
  def room_params
    params.require(:room).permit(:name, user_ids:[])#配列に対して保存を許可したい場合は、キーの名称と関連づけてバリューに「[]」と記述します。
  end
end