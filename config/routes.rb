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

    peerages.each do |peerage|

      namespace peerage do

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
  get '/:peerage/roll_of_honor' => 'peers#index', as: :roll_of_honor
  get '/:peerage/:slug' => 'peers#show', as: :peer
  get '/:peerage/:slug/contact' => 'contact#new', as: :contact
  post '/:peerage/:slug/contact' => 'contact#create'

  root to: "home#index" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
