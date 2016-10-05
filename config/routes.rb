Rails.application.routes.draw do
	resources :brands
	resources :equipments
	resources :customers
	resources :orders

	root 'orders#index'
end
