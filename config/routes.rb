Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'solidarite', to: 'searchs#solidarite'
  get 'assistance', to: 'searchs#assistance'
  get 'financier', to: 'searchs#financier'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'dashboards#profile'
  get 'results_asso', to: 'assos#results'

  resources :assos do
    resources :favs, only: [ :new, :create ]
  end

  resources :favs, only: [ :destroy ]
end
