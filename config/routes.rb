Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'search', to: 'searchs#search'
  get 'search_sub_cat', to: 'searchs#search_sub_cat'
  get 'search_tag', to: 'searchs#search_tag'
  get 'search_address', to: 'searchs#search_address' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'dashboards#profile'
  get 'results_asso', to: 'assos#results'

  resources :assos do
    resources :favs, only: [ :new, :create ]
  end

  resources :favs, only: [ :destroy ]
end
