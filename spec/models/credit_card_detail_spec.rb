require "rails_helper"

describe CreditCardDetail do
  describe "CreditCardDetail belong_to subscription" do
    it { should belong_to(:subscription) }
  end
end