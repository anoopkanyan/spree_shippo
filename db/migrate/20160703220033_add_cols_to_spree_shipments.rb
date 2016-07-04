class AddColsToSpreeShipments < ActiveRecord::Migration
  def change
      add_column :spree_shipments, :shipment_object_id, :string
      add_column :spree_shipments, :object_id, :string
  end
end
