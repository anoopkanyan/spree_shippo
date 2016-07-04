require 'spec_helper'

describe Spree::Api::GoshipmentsController do

context "Heroku types, sending params" do
  
before(:each) do
    request.headers['Content-Type'] = "application/x-www-form-urlencoded"
  end

  let(:received_params) do
    {
      object_id: "44fc4cf8e7bb43bc88a677dfc8c0e4de",
      object_state: "TRANSIT" 
    }
  end

#let(subject) { post :receive, received_params }

  describe "#receives a deploy hook" do
    
    it { should respond_with 200 }
    
  end
end
end