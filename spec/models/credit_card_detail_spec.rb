require "rails_helper"

describe CreditCardDetail do
  describe "CreditCardDetail associaties with following models" do
    it { should belong_to(:subscription) }
  end
end