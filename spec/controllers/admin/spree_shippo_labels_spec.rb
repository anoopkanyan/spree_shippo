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

end