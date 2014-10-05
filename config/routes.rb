Spree::Core::Engine.routes.draw do
	namespace :admin do
		get 'shippo/settings', :to => 'shippo#show', :as => "shippo_settings"
		get 'shippo/orders/', :to => 'shippo#view_orders', :as => "shippo_orders"
		get 'shippo/order/:id', :to => 'shippo#view_order', :as => "shippo_order"
  	end
end
