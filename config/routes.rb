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

      get '/candidates/:id' => 'candidates#show', as: :candidate
      get '/candidates' => 'candidates#index', as: :candidates
      get '/candidates/:id/poll_comments' => 'candidates#poll_comments', as: :poll_comments

      
      get '/poll' => 'ballot#index', as: :ballot
      get '/poll/candidates/:id' => 'ballot#edit', as: :edit_ballot_candidate
      put '/poll/candidates/:id' => 'ballot#update'

      namespace :admin do

        resources :candidates, except: [:show]
        resource :poll, except: [:show, :delete]

        get '/peers' => 'peers#index', as: :peers
        get '/peers/new' => 'peers#new', as: :new_peer
        post '/peers' => 'peers#create', as: :create_peer
        get '/peers/:id/edit' => 'peers#edit', as: :edit_peer
        patch '/peers/:id' => 'peers#update', as: :update_peer
        put '/peers/:id' => 'peers#update'
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
