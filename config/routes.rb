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

    namespace :pelican do
      resources :candidates, only: [:index, :show]
      resources :groups, only: [:index]
      get '/groups/:slug' => 'groups#show', as: :group
      get '/candidates/:id/poll_comments' => 'candidates#poll_comments', as: :poll_comments

      namespace :poll do
        get '/' => 'candidates#index', as: :candidates
        get '/candidates/:id' => 'candidates#edit', as: :edit_candidate
        resources :candidates, only: [:update]
      end

      namespace :admin do
        resources :pelicans, except: :destroy
        resources :candidates, except: :show
        resource :poll, except: [:destroy, :show]
      end
    end

    namespace :laurel do
      resources :candidates, only: [:index, :show]
      resources :groups, only: [:index]
      get '/groups/:slug' => 'groups#show', as: :group
      get '/candidates/:id/poll_comments' => 'candidates#poll_comments', as: :poll_comments
      namespace :poll do
        get '/' => 'candidates#index', as: :candidates
        get '/candidates/:id' => 'candidates#edit', as: :edit_candidate
        resources :candidates, only: [:update]
      end

      namespace :admin do
        resources :laurels
        resources :candidates, except: :show
        resource :poll, except: [:destroy, :show]
      end
    end
  end

  scope :chambers do
    namespace :admin do
      resources :royalty, except: [:destroy, :show] 
    end 
  end

  namespace :laurel do
    get '/groups' => 'groups#index'
    get '/groups/:slug' => 'groups#show', as: :group
    get '/roll_of_honor' => 'peers#index'
    get ':slug' => 'peers#show'
    get ':slug/contact' => '/users/contact#new', as: :contact
    post ':slug/contact' => '/users/contact#create'
  end 
  namespace :pelican do
    get '/groups' => 'groups#index'
    get '/groups/:slug' => 'groups#show', as: :group
    get '/roll_of_honor' => 'peers#index'
    get ':slug' => 'peers#show'
    get ':slug/contact' => '/users/contact#new', as: :contact
    post ':slug/contact' => '/users/contact#create'
  end 


  root to: "home#index" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
