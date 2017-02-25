Rails.application.routes.draw do
  root    'static_pages#home'
  get     'about'     => 'static_pages#about'
  get     'help'      => 'static_pages#help'
  get     'contact'   => 'static_pages#contact'
  get     'signup'    => 'users#new'
  get     'login'     => 'sessions#new'
  post    'login'     => 'sessions#create'
  get     'logout'    => 'sessions#delete'
  delete  'logout'    => 'sessions#destroy'
  get     'profile'   => 'users#show'

  resources :users do
    resources :posts, only: [:index, :new, :create]
  end
  resources :posts, only: [:show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
