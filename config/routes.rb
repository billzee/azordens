Rails.application.routes.draw do
  devise_for :users
	resources :brands
	resources :equipments
	resources :customers
	resources :orders

	root to: 'orders#index'
end
