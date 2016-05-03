
module Spree
  module Api
    module ApiHelpers
       
       #add GoShippo api_keys to the store attributes which are rendered in API response  
       
        @@store_attributes = [
        :id, :name, :url, :meta_description, :meta_keywords, :seo_title,
        :mail_from_address, :default_currency, :code, :goshippo_api,:publishable_api,
        :goshippo_base_api_url,:default
      ]
      
    end 
  end
end