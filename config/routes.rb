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

    get '/:peerage/groups/:slug' => 'groups#show', as: :group
    get '/:peerage/groups' => 'groups#index', as: :groups

    get '/:peerage/candidates/:id' => 'candidates#show', as: :candidate
    get '/:peerage/candidates' => 'candidates#index', as: :candidates
    get '/:peerage/candidates/:id/poll_comments' => 'candidates#poll_comments', as: :poll_comments

    get '/:peerage/poll' => 'ballot#index', as: :ballot
    get '/:peerage/poll/candidates/:id' => 'ballot#edit', as: :edit_ballot_candidate
    put '/:peerage/poll/candidates/:id' => 'ballot#update'

    get '/:peerage/admin/candidates' => 'admin/candidates#index', as: :admin_candidates
    get '/:peerage/admin/candidates/new' => 'admin/candidates#new', as: :admin_new_candidate
    post '/:peerage/admin/candidates' => 'admin/candidates#create', as: :admin_create_candidate
    get '/:peerage/admin/candidates/:id/edit' => 'admin/candidates#edit', as: :admin_edit_candidate
    patch '/:peerage/admin/candidates/:id' => 'admin/candidates#update', as: :admin_update_candidate
    put '/:peerage/admin/candidates/:id' => 'admin/candidates#update'
    delete '/:peerage/admin/candidates/:id' => 'admin/candidates#destroy', as: :admin_delete_candidate

    get '/:peerage/admin/poll/new' => 'admin/polls#new', as: :admin_new_poll
    post '/:peerage/admin/poll' => 'admin/polls#create', as: :admin_create_poll
    get '/:peerage/admin/poll/edit' => 'admin/polls#edit', as: :admin_edit_poll
    patch '/:peerage/admin/poll' => 'admin/polls#update', as: :admin_update_poll
    put '/:peerage/admin/poll' => 'admin/polls#update'

    get '/:peerage/admin/peers' => 'admin/peers#index', as: :admin_peers
    get '/:peerage/admin/peers/new' => 'admin/peers#new', as: :admin_new_peer
    post '/:peerage/admin/peers' => 'admin/peers#create', as: :admin_create_peer
    get '/:peerage/admin/peers/:id/edit' => 'admin/peers#edit', as: :admin_edit_peer
    patch '/:peerage/admin/peers/:id' => 'admin/peers#update', as: :admin_update_peer
    put '/:peerage/admin/peers/:id' => 'admin/peers#update'

  end
  scope :chambers do
    namespace :admin do
      resources :royalty, except: [:destroy, :show] 
    end 
  end

  get '/:peerage/groups' => 'groups#index', as: :groups
  get '/:peerage/groups/:slug' => 'groups#show', as: :group
  get '/:peerage/roll_of_honor' => 'peers#index', as: :roll_of_honor
  get '/:peerage/:slug' => 'peers#show', as: :peer
  get '/:peerage/:slug/contact' => 'contact#new', as: :contact
  post '/:peerage/:slug/contact' => 'contact#create'

  root to: "home#index" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
