require 'spree_core'
require 'spree_shippo_labels/engine'
require 'openssl'
require 'base64'
require 'digest'

module SpreeShippoLabels
    @spree_shippo_user_email = "+spree@goshippo.com"
    @base_url = "https://goshippo.com/"
    @spree_endpoint = "spreecommerce/"
    @auth_endpoint = "auth/"
    @order_endpoint = "orders/"

    def self.get_shippo_user
        if !retrieve_shippo_user
            email = get_shippo_user_email
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
        Spree::User.find_by_email(get_shippo_user_email)
    end

    def self.get_orders_url(email, order_id='')
        return build_shippo_url(@base_url + @spree_endpoint + @order_endpoint + order_id, email)
    end

    def self.get_shippo_user_email
        return Spree::Store.name.gsub(/[^0-9A-Za-z]/, '').downcase + @spree_shippo_user_email
    end

    def self.get_auth_url
        return @base_url + @spree_endpoint + @auth_endpoint
    end

    def self.get_store_name
        return Spree::Store.current.name
    end

    def self.get_store_url
        return Spree::Store.current.url
    end

    def self.build_shippo_url(url, email)
        uri = URI(url)
        params = get_store_params(email)
        uri.query = params.to_query
        return uri.to_s
    end

    def self.get_store_params(email)
        { 
            :store_name => get_store_name,
            :store_url => get_store_url,
            :email => email
        }
    end

    def self.get_api_token
        if Rails.configuration.shippo_partner_secret.blank? || Rails.configuration.shippo_partner_key.blank? || Rails.configuration.shippo_partner_secret.length != 32
            return nil
        else
            api_token = get_shippo_user.spree_api_key

            message = encrypt(api_token)
            return Base64.encode64(message)
        end
    end

    def self.encrypt(message)
        # add SHA to verify integrity when decrypting
        sha = Digest::SHA256.hexdigest message
        message << sha
        # create AES-256 Cipher
        cipher = OpenSSL::Cipher::AES.new(256, :CBC)
        cipher.encrypt
        cipher.key = Rails.configuration.shippo_partner_secret
        # create new, random iv
        iv = OpenSSL::Cipher::AES.new(256, :CBC).random_iv
        cipher.iv = iv
        # return iv and encrypted message with padding
        return iv + cipher.update(message) + cipher.final
    end

end