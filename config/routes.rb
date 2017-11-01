Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)
  devise_for :users
  resources :users, only: [:create]
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'

  get '/groups' => 'groups#index'
  get '/groups/:name' => 'groups#show'

  get '/laurels/:slug' => 'laurels#show', as: :laurel
  get '/laurels' => 'laurels#index'
  get '/laurels/:slug/contact' => 'contact#new', as: :contact_laurel
  post 'laurels/:slug/contact' => 'contact#create'

  get '/chambers' => 'users#index'

  namespace :chambers do
    resources :groups, only: [:index]
    get '/groups/:name' => 'groups#show'
    resources :images, only: [:create]
    namespace :laurel do
      resources :candidates, only: [:index, :show]
      get '/candidates/:id/poll_comments' => 'candidates#poll_comments', as: :poll_comments
      namespace :admin do
        resources :candidates, except: :show
      end
    end
  end
  scope :chambers do
    resources :comments, only: [:create]
    resource :poll, only: [:show]
    namespace :poll do
      get '/candidates/:id' => 'candidates#edit', as: :edit_candidate
      resources :candidates, only: [:update]
    end
    namespace :admin do
      resources :laurels
      #resources :candidates, except: :show
      resources :royalty, except: [:destroy, :show] 
      resource :poll, except: [:destroy, :show]
    end 
  end
  root to: "home#index" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
