require 'spree_core'
require 'spree_shippo_labels/engine'

module SpreeShippoLabels
  @spree_shippo_user_email = "+spree@goshippo.com"
  @base_url = "https://goshippo.com/"
  @spree_endpoint = "spreecommerce/"

  def self.get_shippo_user
      if !retrieve_shippo_user
          email = build_shippo_user_email
          password = SecureRandom.hex(8)
          attributes = {
              :password => password,
              :password_confirmation => password,
              :email => email,
              :login => email,
          }
          admin = Spree::User.new(attributes)
          if admin.save
              role = Spree::Role.find_or_create_by(name: 'admin')
              admin.spree_roles << role
              admin.generate_spree_api_key!
              admin.save
          end
      end
      return retrieve_shippo_user
  end

  def self.retrieve_shippo_user
      Spree::User.find_by_email(build_shippo_user_email)
  end

  def self.build_shippo_user_email
      Spree::Store.name.gsub(/[^0-9A-Za-z]/, '').downcase + @spree_shippo_user_email
  end

  def self.get_orders_url(email, order_id='')
      return self.build_shippo_url(@base_url + @spree_endpoint + order_id, email)
  end

  def self.build_shippo_url(url, email)
      uri = URI(url)
      params = get_store_params(email)
      uri.query = params.to_query
      return uri.to_s
  end

  def self.get_store_params(email)
      { 
          :store_name => Spree::Store.current.name, 
          :store_url => Spree::Store.current.url,
          :email => email,
          :force_registration => Rails.configuration.shippo_register_automatically
      }
  end

end