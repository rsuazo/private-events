Rails.application.routes.draw do
  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
