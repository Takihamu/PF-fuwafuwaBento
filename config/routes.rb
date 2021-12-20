Rails.application.routes.draw do
  # 管理者
  devise_for :admins, skip: %i[registrations passwords], controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do
    get 'homes#top', to: 'admin/sessions#new'

    # items
    resources :items, only: %i[new show index edit create update] do
      get 'search'
    end

    # courses
    resources :courses, only: %i[index edit create update destroy]

    # customers
    resources :customers, only: %i[index edit show update]

    # orders
    resources :orders, only: %i[index show update] do
      resources :order_items, only: %i[index update]
    end
  end

  # 会員
  devise_for :customers, skip: [:passwords], controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }

  scope module: :customers do
    # homes
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'
    # items
    resources :items, only: %i[show index] do
      resource :favorites, only: %i[create destroy]
      collection do
        get 'search'
      end
    end
    # cart_items
    resources :cart_items, only: %i[index create update destroy] do
      collection do
        delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
      end
    end
    # orders
    resources :orders, only: %i[new show index create] do
      collection do
        post 'orders/new' => 'orders#new'
        get 'orders/complete' => 'orders#complete'
      end
    end

    # customers
    resources :customers, only: %i[show edit update] do
      collection do
        get 'customers/leave' => 'customers#leave'
        get :favorites
        patch 'customers/out' => 'customers#out'
      end
    end
  end
end
