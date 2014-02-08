DictoRails::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'

  get 'search', to: 'search#index'

  resources :word_sets do
    resources :words do
      member do
        post 'didnt_know', controller: :learnts
        post 'right',      controller: :learnts
        post 'wrong',      controller: :learnts
      end
    end
    resources :categories
  end

  resources :words do
    resources :meanings, controller: 'words/meanings'
    resources :categories, controller: 'words/categories'
  end

  resources :search_tabs
end
