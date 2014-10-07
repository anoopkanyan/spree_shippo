require 'spec_helper'

describe Spree::Admin::ShippoController do
  stub_authorization!

  it "creates Shippo user" do
    get :show, use_route: :shippo_settings
    expect(assigns(:user).email).to eq(controller.send :build_shippo_user_email)
    expect(assigns(:user).admin?).to be true
  end
end