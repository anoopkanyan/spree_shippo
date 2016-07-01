
module Spree
  module Api
    module ApiHelpers
       
       #add GoShippo api_keys to the store attributes which are rendered in API response  
       
        @@store_attributes = [
        :id, :name, :url, :meta_description, :meta_keywords, :seo_title,
        :mail_from_address, :default_currency, :code, :goshippo_api,:publishable_api,
        :goshippo_base_api_url,:default
      ]
      
      #add GoShippo ids to shipment attributes which are to be rendered in the API response
      @@shipment_attributes = [:id, :tracking, :number, :cost, :shipped_at, :state,
      :parcel_object_id, :tracking_url, :transaction_obj_id, :shipment_object_id,
      :label_url, :return_shipment_obj_id, :return_label_url,
      :refund_object_id, :label_cost, :is_label]
      
      
      #add shipments to permitted order attributes
      @@order_attributes = [
        :id, :number, :item_total, :total, :ship_total, :state, :adjustment_total,
        :user_id, :created_at, :updated_at, :completed_at, :payment_total,
        :shipment_state, :payment_state, :email, :special_instructions, :channel,
        :included_tax_total, :additional_tax_total, :display_included_tax_total,
        :display_additional_tax_total, :tax_total, :currency, :considered_risky,
        :canceler_id, :shipments
      ]
      
    end 
  end
end