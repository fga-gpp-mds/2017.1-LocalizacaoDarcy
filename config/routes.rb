Rails.application.routes.draw do
  namespace :admin do
    get 'departments/index'
  end

  namespace :admin do
    get 'departments/new'
  end

  namespace :admin do
    get 'departments/edit'
  end

  namespace :admin do
    get 'departments/update'
  end

  namespace :admin do
    get 'departments/create'
  end

  namespace :admin do
    get 'departments/destroy'
  end

  devise_scope :admin do
    get 'admin/login', to: 'devise/sessions#new', as: 'new_login'
    post 'admin/login', to: 'devise/sessions#create', as: 'login'
    get 'admin/logout', to: 'devise/sessions#destroy', as: 'logout'
    get 'admin/registration', to: 'devise/registrations#new', as: 'new_registration'
    post 'admin/registration', to: 'devise/registrations#create', as: 'registration'
  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'map#index'

  get 'admin', to: 'admin#index'
  namespace :admin do
    resources :buildings, except: [:show]
    resources :rooms
    resources :departments
    resources :admin
  end

  get 'app/views/map/index.html.erb', to: 'map#index', as: 'map'
  get 'app/views/about/about.html.erb', to: 'about#about', as: 'about'
  get 'admin/index'

  get 'map/data'

  get 'map/building/:id', to: 'map#building'

  get 'map/routes'
end
