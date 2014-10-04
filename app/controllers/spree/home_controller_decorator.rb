require 'highline/import'
load 'spree/user.rb'

module Spree
  HomeController.class_eval do
    def create_shippo_user
        password = SecureRandom.hex(8)
        storename = Spree::Store.name.gsub(/[^0-9A-Za-z]/, '').downcase
        email = storename + "+spree@goshippo.com"
        attributes = {
            :password => password,
            :password_confirmation => password,
            :email => email,
            :login => email,
        }
        if Spree::User.find_by_email(email)
            admin = Spree::User.find_by_email(email)
            puts " Found and used"
        else
            puts "NOt found lets create"
            admin = Spree::User.new(attributes)
            if admin.save
                role = Spree::Role.find_or_create_by(name: 'admin')
                admin.spree_roles << role
                admin.save
            end
        end
        admin.generate_spree_api_key!
        puts @spree_current_user.inspect
        @user = Spree::User.find_by_email(email)
    end
  end
end