Refinery::Core::Engine.routes.draw do

  # Frontend routes
  #namespace :products, :path => Refinery::Products.shop_path do
  namespace :product_specs do
    #root to: "categories#index", via: :get
    #get "#{Refinery::Products.products_categories_path}/*path", to: 'categories#show', as: :category

    #scope :path => Refinery::Products.products_categories_path do
#    scope :path => Refinery::ProductSpecs.product_specs_path do
      #resources :categories, :path => '', :as => :categories, :controller => 'categories'
      resources :specs, :path => '', :as => :specs, :controller => 'specs'
#    end

    #scope :path => Refinery::Products.products_path do
    #  resources :products, :path => '', :as => :products, :controller => 'products'
    #end
  end

  # Admin routes
  #namespace :products, :path => '' do
  namespace :product_specs, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
        #root :to => "products#index"
        #root :to => "product_specs#index"

        #resources :products, :except => :show do
        resources :product_specs, :except => :show do
          collection do
            get :uncategorized
          end
        end

        #get 'categories/*path/edit', to: 'categories#edit', as: 'edit_category'
        #get 'categories/*path/children', to: 'categories#children', as: 'children_categories'
        #patch 'categories/*path', to: 'categories#update', as: 'update_category'
        #delete 'categories/*path', to: 'categories#destroy', as: 'delete_category'

        #resources :categories, except: :show do
          #post :update_positions, on: :collection
        #end

        #resources :properties, except: :show do
        #  post :update_positions, on: :collection
        #end
      end
  end
end
