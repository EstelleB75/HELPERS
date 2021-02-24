Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'solidarite', to: 'searchs#solidarite'
  get 'assistance', to: 'searchs#assistance'
  get 'financier', to: 'searchs#financier'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :dashboard, only: [ :show ]

  resources :assos do
    resources :favs, only: [ :new, :create ]
  end
end
