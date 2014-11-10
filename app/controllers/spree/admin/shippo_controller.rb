class Spree::Admin::ShippoController < Spree::Admin::BaseController
    include SpreeShippoLabels

    def show
        @shippo_connect_endpoint = SpreeShippoLabels.get_auth_url
        @store_url = SpreeShippoLabels.get_store_url
        @store_name = SpreeShippoLabels.get_store_name
        @partner_key = Rails.configuration.shippo_partner_key
        @api_token = SpreeShippoLabels.get_api_token
        @register_automatically = Rails.configuration.shippo_register_automatically
        @user_usps_set = Rails.configuration.shippo_user_usps_set
    end

    def view_order
        redirect_to ( SpreeShippoLabels.get_orders_url(spree_current_user.email, params[:id]) )
    end

    def view_orders
        redirect_to ( SpreeShippoLabels.get_orders_url(spree_current_user.email) )
    end

end