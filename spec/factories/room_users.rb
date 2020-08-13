FactoryBot.define do
  factory :room_user do
    association :user
    association :room
  end
  #必要なカラムの値を定義
end