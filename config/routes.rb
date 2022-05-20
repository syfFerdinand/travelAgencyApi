Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :guides
      resources :automobiles
      resources :cities do
        resources :sites
      end
    end
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
