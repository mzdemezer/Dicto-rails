DictoRails::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'

  resources :word_sets
  get 'search', to: 'search#index'
end
