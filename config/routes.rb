Rails.application.routes.draw do
  devise_for :contracted_side_users
  devise_for :consignment_side_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
