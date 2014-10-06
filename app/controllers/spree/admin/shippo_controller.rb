class Spree::Admin::ShippoController < Spree::Admin::BaseController
    @@base_url = 'https://goshippo.com/'
    @@spree_endpoint = 'spreecommerce/'
    @@spree_shippo_user_email = "+spree@goshippo.com"

    def show
        get_shippo_user
    end

    def view_order
        redirect_to_url( @@base_url + @@spree_endpoint + params[:id] )
    end

    def view_orders
        redirect_to_url( @@base_url + @@spree_endpoint )
    end

    private

    def get_shippo_user
        if !retrieve_shippo_user
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
        @user = retrieve_shippo_user
    end

    def retrieve_shippo_user
        Spree::User.find_by_email(build_shippo_user_email)
    end

    def build_shippo_user_email
        Spree::Store.name.gsub(/[^0-9A-Za-z]/, '').downcase + @@spree_shippo_user_email
    end

    def redirect_to_url(url)
        uri = URI(url)
        params = get_store_params
        uri.query = params.to_query
        redirect_to uri.to_s
    end

    def get_store_params
        { 
            :store_name => Spree::Store.current.name, 
            :store_url => Spree::Store.current.url,
            :email => spree_current_user.email
        }
    end

end