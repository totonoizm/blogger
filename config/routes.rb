Rails.application.routes.draw do
  root "blogs#index"
  devise_for :admins
  resources :blogs do
    collection do
      get "confirm"
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
