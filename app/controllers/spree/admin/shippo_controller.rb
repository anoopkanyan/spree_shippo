class Spree::Admin::ShippoController < Spree::Admin::BaseController
    include SpreeShippoLabels

    def show
        @user = SpreeShippoLabels.get_shippo_user
    end

    def view_order
        redirect_to ( SpreeShippoLabels.get_orders_url(spree_current_user.email, params[:id]) )
    end

    def view_orders
        redirect_to ( SpreeShippoLabels.get_orders_url(spree_current_user.email) )
    end

end