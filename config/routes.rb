Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)
  devise_for :users
  resources :users, only: [:create]
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'

  get '/groups' => 'groups#index'
  get '/groups/:name' => 'groups#show'

  get '/laurels/:slug' => 'laurels#show'
  get '/laurels' => 'laurels#index'

  get '/chambers' => 'users#index'

  namespace :chambers do
    resources :groups, only: [:index]
    get '/groups/:name' => 'groups#show'
  end
  scope :chambers do
    resources :comments, only: [:create]
    resources :candidates, only: [:index, :show]
    resource :poll, only: [:show]
    namespace :poll do
      get '/candidates/:id' => 'candidates#edit', as: :edit_candidate
      resources :candidates, only: [:update]
    end
    namespace :admin do
      resources :laurels
      resources :candidates, except: :show
      resources :royalty, except: [:destroy, :show] 
      resource :poll, except: [:destroy, :show]
    end 
  end
  root to: "home#index" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
