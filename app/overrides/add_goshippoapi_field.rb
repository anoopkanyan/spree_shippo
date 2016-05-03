Deface::Override.new(:virtual_path => 'spree/admin/general_settings/edit',
  :name => 'add_goshippo_api_field',
  :insert_after => "[data-hook='admin_general_setting_input_name']",
  :text => '
<div class="row">
  <div class="col-md-12">
    <div class="form-group" data-hook="admin_general_setting_input_goshippo_api">
      <%= f.label :goshippo_api %>
      <%= f.text_field :goshippo_api, class: "form-control" %>
    </div>
  </div>
</div>
  ')
Deface::Override.new(:virtual_path => 'spree/admin/general_settings/edit',
  :name => 'add_publishable_api_field',
  :insert_after => "[data-hook='admin_general_setting_input_seo_title']",
  :text => '
<div class="row">
  <div class="col-md-12">
    <div class="form-group" data-hook="admin_general_setting_input_seo_title">
      <%= f.label :goshippo_publishable_api %>
      <%= f.text_field :publishable_api, class: "form-control"  %>
    </div>
  </div>
</div>
  ')