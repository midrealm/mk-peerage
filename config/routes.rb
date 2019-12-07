Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)
  devise_for :users
  resources :users, only: [:create]
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'
  get '/users/edit/password' => 'users#edit_password'
  patch '/users/edit/password' => 'users#update_password'
	get '/users/set_up_account' => 'setup#new'
	post '/users/set_up_account' => 'setup#create'
   
  
  
  get '/chambers' => 'users#index'

  namespace :chambers do
    resources :documents, only: [:create]

    resources :comments, only: [:create, :edit, :update]

    namespace :admin do
      resources :royalty, except: [:destroy, :show] 
    end

    scope '/:peerage/' do
      get '/groups/:slug' => 'groups#show', as: :group
      get '/groups' => 'groups#index', as: :groups

      get '/specialties' => 'specialties#index', as: :specialties
      get '/specialties/:slug' => 'specialties#show', as: :specialty

      resources :candidates, only: [:index, :show]
      get '/candidates/:id/poll_comments' => 'candidates#poll_comments', as: :poll_comments
      
      get '/poll' => 'ballot#index', as: :ballot
      get '/poll/candidates/:id' => 'ballot#edit', as: :edit_ballot_candidate
      put '/poll/candidates/:id' => 'ballot#update'
      patch '/poll/candidates/:id' => 'ballot#update'

      get '/candidates/:id/documents' => 'documents#index', as: :documents_index

      namespace :admin do

        resources :candidates, except: [:show]
        resources :polls, only: [:index]
        put '/polls/:id/publish' => 'polls#publish', as: :publish_poll
        resource :poll, except: [:show, :delete]
        get '/poll/analytics' => 'polls#analyze', as: :analyze_poll
        resource :news, only: [:edit, :update]
        resources :peers, except: [:show, :delete]
        namespace :peers do
          get 'password' => 'password#new'
          post 'password' => 'password#create'
          get 'email' => 'email#new'
          post 'email' => 'email#create'
        end
      end
    end
  end

  scope '/:peerage/' do
    get '/' => 'order#index', as: :order
    get '/order_secretary/contact' => 'order_secretary_contact#new', as: :contact_order_secretary
    post '/order_secretary/contact' => 'order_secretary_contact#create'
    get '/specialties' => 'specialties#index', as: :specialties
    get '/specialties/:slug' => 'specialties#show', as: :specialty
    get '/groups' => 'groups#index', as: :groups
    get '/groups/:slug' => 'groups#show', as: :group
    get '/roll_of_honor' => 'peers#index', as: :roll_of_honor
    get '/:slug' => 'peers#show', as: :peer
    get '/:slug/contact' => 'contact#new', as: :contact
    post '/:slug/contact' => 'contact#create'
  end

  root to: "home#index" 
end
