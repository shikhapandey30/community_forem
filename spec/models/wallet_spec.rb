require "rails_helper"

describe Wallet do
  describe "Wallet associaties with following models" do
    it "It should belong_to wallet" do 
      should belong_to(:walletable)
    end
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
  end
end