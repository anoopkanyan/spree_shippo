
Spree::Shipment.class_eval do

#  override the method to not send shipped email, rather send the email when in transit,
#  receiving notification from the webhook
    def after_ship
        inventory_units.each &:ship!
        touch :shipped_at
        update_order_shipment_state
     end    

end    