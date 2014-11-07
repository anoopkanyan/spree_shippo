require 'spec_helper'

describe SpreeShippoLabels do
  class DummyClass
  end

  let!(:store) { FactoryGirl.create(:store) }

  before(:all) do
    @dummy = DummyClass.new
    @dummy.extend SpreeShippoLabels
  end

  describe "get_orders_url" do
    it "retrieves orders url" do
      expect(SpreeShippoLabels.get_orders_url('test@test.com')).not_to be_empty
    end
  end

  describe "get_shippo_user_email" do
    it "gets the Shippo user's email" do
      expect(SpreeShippoLabels.get_shippo_user_email).not_to be_empty
    end
  end

  describe "get_auth_url" do
    it "retrieves authentication url" do
      expect(SpreeShippoLabels.get_auth_url).not_to be_empty
    end
  end

  describe "get_store_name" do
    it "retrieves the current Spree stores name" do
      expect(SpreeShippoLabels.get_store_name).not_to be_empty
    end
  end

  describe "get_store_url" do
    it "retrieves the current Spree stores url" do
      expect(SpreeShippoLabels.get_store_url).not_to be_empty
    end
  end

  describe "get_api_token_no_partner" do
    it "does not return the api token" do
      Rails.configuration.shippo_partner_secret = nil
      Rails.configuration.shippo_partner_secret = nil
      expect(SpreeShippoLabels.get_api_token).to be_nil 
    end
  end

  describe "get_api_token_with_partner" do
    it "returns encrypted api token" do
      Rails.configuration.shippo_partner_key = 'shippo'
      Rails.configuration.shippo_partner_secret = 'Shippopartnersecret_32characters'
      expect(SpreeShippoLabels.get_api_token).not_to be_nil 
    end
  end

end