Rails.application.routes.draw do
  get 'consignment_side_users/show'
  get 'users/show'
  devise_for :contracted_side_users
  devise_for :consignment_side_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :consignment_side_users, only: [:show]
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy], shallow: true do
    resource :favorites, only: [:create, :destroy, :show]
  end
end
