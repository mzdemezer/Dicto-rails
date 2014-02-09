DictoRails::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'

  resources :word_sets do
    resources :words do
      member do
        post 'didnt_know', controller: :learnts
        post 'right',      controller: :learnts
        post 'wrong',      controller: :learnts
      end
    end
    resources :user_word_sets
    resources :categories
  end

  resources :words do
    resources :meanings, controller: 'words/meanings'
    resources :categories, controller: 'words/categories'
  end

  resources :search_tabs

  resources :users

  resources :invitations
end
