require "rails_helper"

describe Institute do
  describe "Institute has many subscription" do
    it { should have_many(:education_histories) }
  end
end