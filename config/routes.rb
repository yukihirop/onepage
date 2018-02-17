Rails.application.routes.draw do
  # APIのルーティングを設定
  mount API::Root => '/'
end
