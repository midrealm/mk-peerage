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

    get '/:peerage/candidates/:id' => 'candidates#show', as: :candidate
    get '/:peerage/candidates' => 'candidates#index', as: :candidates
    get '/:peerage/candidates/:id/poll_comments' => 'candidates#poll_comments', as: :poll_comments

    get '/:peerage/poll' => 'ballot#index', as: :ballot
    get '/:peerage/poll/candidates/:id' => 'ballot#edit', as: :edit_ballot_candidate
    put '/:peerage/poll/candidates/:id' => 'ballot#update'

    get '/:peerage/admin/candidates' => 'admin/candidates#index', as: :admin_candidates
    get '/:peerage/admin/candidates/new' => 'admin/candidates#new', as: :admin_new_candidate
    post '/:peerage/admin/candidates' => 'admin/candidates#create'
    get '/:peerage/admin/candidates/:id/edit' => 'admin/candidates#edit', as: :admin_edit_candidate
    put '/:peerage/admin/candidates/:id' => 'admin/candidates#update'
    delete '/:peerage/admin/candidates/:id' => 'admin/candidates#destroy', as: :admin_delete_candidate

    peerages.each do |peerage|

      namespace peerage do

        namespace :admin do
          resources peerage.to_s.pluralize.to_sym, except: :destroy
          #resources :candidates, except: :show
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
  get '/:peerage/roll_of_honor' => 'peers#index', as: :roll_of_honor
  get '/:peerage/:slug' => 'peers#show', as: :peer
  get '/:peerage/:slug/contact' => 'contact#new', as: :contact
  post '/:peerage/:slug/contact' => 'contact#create'

  root to: "home#index" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
