require "rails_helper"

describe CommunityPolicy do
  subject { described_class }

  permissions :update?, :edit?, :destroy? do
    it "denies access if community is not user" do
      expect(subject).not_to permit(FactoryGirl.create(:user),FactoryGirl.create(:community))
    end

     it "Grant access if community is user" do
      user = FactoryGirl.create(:user)
      expect(subject).to permit(user,Community.create(:topic => "new topic", :description => "new desciption", :category_id=> 1 ,:user_id => user.id))
    end
  end
end