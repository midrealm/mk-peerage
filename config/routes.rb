Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)
  devise_for :users
  resources :users, only: [:create]
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'
  
  
  get '/chambers' => 'users#index'

  namespace :chambers do
    resources :images, only: [:create]
    resources :comments, only: [:create]

    namespace :admin do
      resources :royalty, except: [:destroy, :show] 
    end

    scope '/:peerage/' do
      get '/groups/:slug' => 'groups#show', as: :group
      get '/groups' => 'groups#index', as: :groups

      resources :candidates, only: [:index, :show]
      get '/candidates/:id/poll_comments' => 'candidates#poll_comments', as: :poll_comments
      
      get '/poll' => 'ballot#index', as: :ballot
      get '/poll/candidates/:id' => 'ballot#edit', as: :edit_ballot_candidate
      put '/poll/candidates/:id' => 'ballot#update'
      patch '/poll/candidates/:id' => 'ballot#update'

      namespace :admin do

        resources :candidates, except: [:show]
        resource :poll, except: [:show, :delete]
        resources :peers, except: [:show, :delete]
      end
    end
  end

  scope '/:peerage/' do
    get '/groups' => 'groups#index', as: :groups
    get '/groups/:slug' => 'groups#show', as: :group
    get '/roll_of_honor' => 'peers#index', as: :roll_of_honor
    get '/:slug' => 'peers#show', as: :peer
    get '/:slug/contact' => 'contact#new', as: :contact
    post '/:slug/contact' => 'contact#create'
  end

  root to: "home#index" 
end
