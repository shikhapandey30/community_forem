require "rails_helper"

describe Subscription do
  describe "Subscription associaties with following models" do
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
    it "It should belong_to payer" do 
      should belong_to(:payer).class_name('User').with_foreign_key('payer_id')
    end
    it "It should belong_to subscribable" do 
      should belong_to(:subscribable)
    end
    it "It should have one credit_card_detail" do 
     should have_one(:credit_card_detail)
    end
  end
end