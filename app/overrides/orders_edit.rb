Deface::Override.new(:virtual_path => 'spree/admin/orders/edit',
  :name => 'add_shippo_button_to_order_page',
  :insert_before => "erb[loud]:contains('event_links')",
  :text => '
    <li>
      <%= button_link_to Spree.t(:view_on_shippo), admin_shippo_order_path(@order.id), :icon => "", :target => "_blank" %>
    </li>
  ')