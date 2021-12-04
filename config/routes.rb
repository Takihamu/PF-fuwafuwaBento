Rails.application.routes.draw do
  devise_for :admins, skip:[:registrations, :passwords],controllers: {
  sessions: 'admins/sessions'
  }
  namespace :admins do
  get  'homes#top',to: 'admin/sessions#new'
  end


  devise_for :customers, skip: [:passwords,], controllers: {
    sessions:      'customers/sessions',
    registrations: 'customers/registrations'
  }

  scope module: :customers do
    root to: 'homes#top'
    get 'homes#about' => 'homes#about'
  end
end