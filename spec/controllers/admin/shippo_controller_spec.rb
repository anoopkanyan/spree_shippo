require 'spec_helper'

describe Spree::Admin::ShippoController do
  stub_authorization!

  it "creates Shippo user" do
  	include SpreeShippoLabels
    get :show, use_route: :shippo_settings
    expect(assigns(:user).email).to eq(SpreeShippoLabels.get_shippo_user_email)
    expect(assigns(:user).admin?).to be true
  end
end