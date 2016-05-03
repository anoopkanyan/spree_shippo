class AddGoshippoapiToSpreeStores < ActiveRecord::Migration
  def change
    add_column :spree_stores, :goshippo_api, :string
  	add_column :spree_stores, :publishable_api, :string
  	add_column :spree_stores, :goshippo_base_api_url, :string, :default => 'https://api.goshippo.com/v1'
  end
end
