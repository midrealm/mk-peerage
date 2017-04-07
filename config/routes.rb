Rails.application.routes.draw do
  devise_for :users
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'

  get '/laurels/:sca_name' => 'laurels#show'
  get '/laurels' => 'laurels#index'
  get '/chambers' => 'users#index'
  get '/chambers/admin/add_new_laurel' => 'users#new'
  scope :chambers do
    resources :candidates, only: [:index, :show, :create, :update] 
    get 'admin/add_new_candidate' => 'candidates#new'
    resources :comments, only: [:create]
  end
  root to: "home#index" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
