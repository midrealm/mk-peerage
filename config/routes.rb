Rails.application.routes.draw do
  devise_for :users
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'

  get '/laurels/:sca_name' => 'laurels#show'
  get '/laurels' => 'laurels#index'
  namespace :chambers do
    resources :candidates, only: [:index, :show, :edit]
    resources :comments, only: [:create]
  end
  root to: "home#index" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
