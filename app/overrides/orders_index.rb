Deface::Override.new(:virtual_path => 'spree/admin/orders/index',
  :name => 'add_shippo_button_to_send_auth_token',
  :insert_after => "erb[silent]:contains('content_for :page_actions')",
  :text => "
    <li>
      <%= button_link_to Spree.t('Connect to Shippo'), 'https://goshippo.com/users/connect/godaddy', :icon => '' %>
    </li>
  ")

Deface::Override.new(:virtual_path => 'spree/admin/orders/index',
  :name => 'add_shippo_button_to_orders_page',
  :insert_after => "erb[silent]:contains('content_for :page_actions')",
  :text => "
    <li>
      <%= button_link_to Spree.t('Shippo Orders'), 'https://goshippo.com/user/orders/', :icon => '' %>
    </li>
  ")