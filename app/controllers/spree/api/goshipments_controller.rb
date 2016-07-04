class Spree::Api::GoshipmentsController < Spree::Api::BaseController
    
    skip_before_filter :verify_authenticity_token

    #defualt packages to be rendered 
    def package_type
        render json: PackageType.all
    end
    
    #create a webhook to receive updates from GoShippo
    def receive
        
        if request.headers['Content-Type'] == 'application/json'
        data = JSON.parse(request.body.read) 
        else
        # application/x-www-form-urlencoded
        data = params.as_json
        end

        object_id = data["object_id"]
        status = data["object_status"]
        shipment = Spree::Shipment.find_by(object_id: object_id)
        order = Spree::Order.find(shipment.order_id)
        if status == "TRANSIT"
            #send out an email to notify the customer the order has been shipped
            ShipmentMailer.shipped_email(shipment).deliver
            shipment.ship
        end
        #Webhook::Received.save(data: data, integration: params[:integration_name])

        render :nothing => true, :status => 200
    end    
end
 