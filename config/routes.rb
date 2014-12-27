Version::Application.routes.draw do
  devise_for :users
  resources :videos
  resources :authors
  resources :sounds
  resources :news
  resources :images
  match '/images/:id/:position' => 'images#show', via: :get
      

  resources :textuals
  resources :categories
  resources :posts

  namespace :admin do
      resources :categories
      resources :textuals do
        get :autocomplete_author_name, :on => :collection
      end
      resources :users
      resources :images do
        get :autocomplete_author_name, :on => :collection
      end
      resources :sounds do
        get :autocomplete_author_name, :on => :collection
      end
      resources :authors
      resources :videos do
        get :autocomplete_author_name, :on => :collection
      end
      resources :news
  end

  match '/' => 'posts#index', via: :get
  match '/feed' => 'posts#index', :as => :feed, :format => 'rss', via: :get
  match '/about' => 'posts#about', :as => :about, via: :get
  match '/contributors' => 'posts#contributors', :as => :contributors, via: :get
  match '/context' => 'posts#context', :as => :context, via: :get
  match '/:controller(/:action(/:id))', via: :get
  match '/admin' => 'admin/news#index', via: :get
end
