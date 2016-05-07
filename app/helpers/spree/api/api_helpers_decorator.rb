
module Spree
  module Api
    module ApiHelpers
       
       #add GoShippo api_keys to the store attributes which are rendered in API response  
       
        @@store_attributes = [
        :id, :name, :url, :meta_description, :meta_keywords, :seo_title,
        :mail_from_address, :default_currency, :code, :goshippo_api,:publishable_api,
        :goshippo_base_api_url,:default
      ]
      
      #add GoShippo ids to shipment attributes whicah are to be rendered in the API response
    
      @@shipment_attributes = [:id, :tracking, :number, :cost, :shipped_at, :state,
      :parcel_object_id, :tracking_url, :transaction_obj_id, :shipment_object_id,
      :label_url, :return_shipment_obj_id, :return_label_url,
      :refund_object_id]
      
    end 
  end
end