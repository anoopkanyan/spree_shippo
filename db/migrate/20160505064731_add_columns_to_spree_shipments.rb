class AddColumnsToSpreeShipments < ActiveRecord::Migration
  def change
      	add_column :spree_shipments, :tracking_url, :string
      	add_column :spree_shipments, :parcel_object_id, :string
    		add_column :spree_shipments, :shipment_obj_id, :string
      	add_column :spree_shipments, :transaction_obj_id, :string
      	add_column :spree_shipments, :label_url, :string
      	add_column :spree_shipments, :return_shipment_obj_id, :string
      	add_column :spree_shipments, :return_label_url, :string
      	add_column :spree_shipments, :refund_object_id, :string
  end
end
