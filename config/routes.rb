Tour::Application.routes.draw do
  root to: "top#index"

  get "about" => "top#about", as: "about"
  get "login" => "top#login", as: "login"

  #会員
  resources :members, except: [:index, :destroy] do
    resources :reservations, only: [:show, :edit, :update]
  end
  #ツアー予約
  resources :reservations, only: [:new, :create]
  #ログイン
  resource :session, only: [:create, :destroy]
  #ツアー詳細
  resources :tour_infomations, only: [:show] do
    collection { get "search", "category" }
    #レビュー
    resources :reviews, except: [:index, :show]
  end

  #管理者
  namespace :admin do
    root to: "top#index"
    resources :reviews, only: [:index, :destroy]
    resources :tour_infomations do
      collection { get "search", "category" }
      resources :details, except: [:idex, :show] do
        member { get "copy" }
      end
      resources :reservations, only: [:destroy]
    end
    resources :reservations, only: [:index, :destroy]
  end
end