Spree::Core::Engine.routes.draw do
  get "/shippo/connect" => "home#create_shippo_user"
end
