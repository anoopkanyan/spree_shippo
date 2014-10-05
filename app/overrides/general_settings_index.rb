Deface::Override.new(:virtual_path => 'spree/admin/shared/_configuration_menu',
  :name => 'add_shippo_submenu',
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
  :text => '
  	<%= configurations_sidebar_menu_item Spree.t(:shippo_settings), admin_shippo_settings_path %>
  ')