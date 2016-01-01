require "rails_helper"

describe Dislike do
  describe "Dislike associaties with dislikable" do
    it { should belong_to(:dislikable) }
  end
end