Rails.application.routes.draw do
  #管理者
  devise_for :admins, skip:[:registrations, :passwords],controllers: {
  sessions: 'admins/sessions'
  }
  namespace :admins do
  get  'homes#top',to: 'admin/sessions#new'

  #items
  resources :items, only:[:new, :show, :index, :edit, :create, :update]

  #courses
  resources :courses, only:[:index, :edit, :create, :update]

  #customers
  resources :customers, only:[:index, :edit, :show, :update]

  #orders
  resources :orders, only:[:index, :show, :update] do
    resources :order_items, only:[:index, :update]
  end
end

  #会員
  devise_for :customers, skip: [:passwords,], controllers: {
    sessions:      'customers/sessions',
    registrations: 'customers/registrations'
  }

  scope module: :customers do
    #homes
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'
    #items
    resources :items, only:[:show, :index]do
      resources :favorites, only: [:create, :destroy]
    end
    #cart_items
    resources :cart_items, only:[:index, :create, :update, :destroy]do
      collection do
        delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
      end
    end
    #orders
    resources :orders, only:[:new, :show, :index, :create] do
      collection do
        post 'orders/new' => 'orders#new'
        get 'orders/complete' => 'orders#complete'
      end
    end

    #customers
    resources :customers, only:[:show, :edit, :update]do
      collection do
        get 'customers/leave' => 'customers#leave'
        get :favorites
        patch 'customers/out' => 'customers#out'
      end
    end
  end
end