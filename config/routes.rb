Rails.application.routes.draw do
  devise_for :users
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'
  root to: "home#index" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
