Rails.application.routes.draw do
  peerages = [:laurel, :pelican]
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)
  devise_for :users
  resources :users, only: [:create]
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'
  
  
  get '/chambers' => 'users#index'

  namespace :chambers do
    resources :images, only: [:create]
    resources :comments, only: [:create]

    get '/:peerage/groups/:slug' => 'groups#show', as: :group
    get '/:peerage/groups' => 'groups#index', as: :groups

    peerages.each do |peerage|

      namespace peerage do
        resources :candidates, only: [:index, :show]
        get '/candidates/:id/poll_comments' => 'candidates#poll_comments', as: :poll_comments

        namespace :poll do
          get '/' => 'candidates#index', as: :candidates
          get '/candidates/:id' => 'candidates#edit', as: :edit_candidate
          resources :candidates, only: [:update]
        end

        namespace :admin do
          resources peerage.to_s.pluralize.to_sym, except: :destroy
          resources :candidates, except: :show
          resource :poll, except: [:destroy, :show]
        end

      end
    end
  end

  scope :chambers do
    namespace :admin do
      resources :royalty, except: [:destroy, :show] 
    end 
  end

  get '/:peerage/groups' => 'groups#index', as: :groups
  get '/:peerage/groups/:slug' => 'groups#show', as: :group

  peerages.each do |peerage| 
    namespace peerage do
      get '/roll_of_honor' => 'peers#index'
      get ':slug' => 'peers#show'
      get ':slug/contact' => '/users/contact#new', as: :contact
      post ':slug/contact' => '/users/contact#create'
    end 
  end


  root to: "home#index" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
