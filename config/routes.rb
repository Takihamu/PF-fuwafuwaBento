Rails.application.routes.draw do
  #管理者
  devise_for :admins, skip:[:registrations, :passwords],controllers: {
  sessions: 'admins/sessions'
  }
  namespace :admins do
  get  'homes#top',to: 'admin/sessions#new'

  #items
  resources :items, only:[:new, :show, :index, :edit, :create, :update]

  #couses
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
    resources :items, only:[:show, :index]
    #cart_items
    resources :cart_items, only:[:index, :create, :update, :destroy]

    #orders
    resources :orders, only:[:new, :show, :index, :create]

    #customers
    resources :customers, only:[:show, :edit, :update]
  end
end