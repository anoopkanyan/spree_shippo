FactoryGirl.define do
  factory :user, class: Spree.user_class do
    email { generate(:random_email) }
    login { email }
    password 'secret'
    password_confirmation { password }

    factory :admin_user do
      spree_roles { [Spree::Role.find_by(name: 'admin') || create(:role, name: 'admin')] }
    end
  end
end