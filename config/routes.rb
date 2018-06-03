Rails.application.routes.draw do
  namespace :api do 
    namespace :v1, default_format: :json do 
      devise_for :users
      resources :schools
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
