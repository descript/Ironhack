Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :sandwiches, only: [:index, :show, :create, :update, :destroy]
  end
end
