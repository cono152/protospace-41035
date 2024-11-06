Rails.application.routes.draw do
  devise_for :users  # Deviseルーティングの設定
  root to: "prototypes#index"  # ルートパスをPrototypesControllerのindexアクションに設定

  # prototypesリソースのすべてのRESTfulルートを設定
  resources :prototypes do
    resources :comments, only: [:create]  # ネストされたコメントのルートを追加
    collection do
      get 'search'
    end
  end

  # userリソースのルートを追加
  resources :users, only: [:show, :edit, :update]

  # 静的ページのルート設定
  resources :static_pages, only: :top


end