class AddRatetoSpreeShipments < ActiveRecord::Migration
  def change
    	add_column :spree_shipments, :label_cost, :decimal
      add_column :spree_shipments, :is_label, :boolean
  end
end
