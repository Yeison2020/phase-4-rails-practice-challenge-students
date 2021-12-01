Rails.application.routes.draw do
  resources :instructors, only: [:create, :index, :update, :destroy]
  resources :students, only: [:create, :index, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
