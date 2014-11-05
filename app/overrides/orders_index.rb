Deface::Override.new(:virtual_path => 'spree/admin/orders/index',
  :name => 'add_shippo_button_to_orders_page',
  :insert_after => "erb[silent]:contains('content_for :page_actions')",
  :text => "
    <li>
      <%= button_link_to Spree.t(:view_on_shippo), admin_shippo_orders_path, :icon => '', :target => '_blank' %>
    </li>
  ")