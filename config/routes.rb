Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)
  devise_for :users
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'

  get '/groups' => 'groups#index'
  get '/groups/:name' => 'groups#show'
  get '/laurels/:sca_name' => 'laurels#show'
  get '/laurels' => 'laurels#index'
  get '/chambers' => 'users#index'
  get '/chambers/admin/add_new_laurel' => 'users#new'
  namespace :chambers do
    resources :groups, only: [:index]
    get '/groups/:name' => 'groups#show'
  end
  scope :chambers do
    resources :candidates
    get '/manage_candidates' => 'candidates#manage'
    resources :comments, only: [:create]
  end
  root to: "home#index" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
