Rails.application.routes.draw do
  devise_for :users
  root "rooms#index"
  resources :users,only: [:edit, :update]
  resources :rooms,only: [:new,:create] do
    resources :messages, only: [:index, :create] #まず、メッセージ送信機能に必要なindexとcreateのルーティングを記述します。
  #メッセージを投稿する際には、どのルームで投稿されたメッセージなのかをパスから判断できるようにしたいので、ルーティングのネストを利用します。
#今回の場合、ネストをすることにより、roomsが親で、messagesが子という親子関係になるので、チャットルームに属しているメッセージという意味になります。
#これによって、メッセージに結びつくルームのidの情報を含んだパスを、受け取れるようになります。
#上記のルーティングを設定した後に、「rails routes」コマンドを実行しましょう。
#URIに注目すると、ネストによって、/rooms/:room_id/messagesとなっています。これはメッセージに紐付いているチャットルームのidという意味です。
#サイドバーのチャットルーム名に、 <%= link_to room.name, room_messages_path(room) %>とリンクを設定します。
# パスにroomを引数とすることで、メッセージと紐付いているチャットルームのidを持たせることができます。
# したがって、チャットルーム名をクリックすると、messagesコントローラーのindexアクションが実行され、チャットルームのページに遷移できます。


end
end
